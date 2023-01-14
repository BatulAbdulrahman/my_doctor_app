import 'dart:async';

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieapp/core/models/doctor/doctor.dart';
import 'package:stacked/stacked.dart';

import '../../../core/repositories/doctors_repository/doctors_repository.dart';
import '../../../generated/l10n.dart';
import '../../widgets/stateless/Doctor_tile/doctor_tile.dart';
import '/core/constant/end_point_parameters.dart';
import '../../../../locator.dart';
import '../../widgets/stateless/indicators/empty_list_indicator.dart';
import '../../widgets/stateless/indicators/error_indicator.dart';
import '../../widgets/stateless/indicators/loading_circular_progress_indicator.dart';

import 'doctors_list_view_model.dart';

// ignore: must_be_immutable
class PagedDoctorsListView extends StatefulWidget {
  final ValueChanged<Doctor> onDoctorsClicked;
  Map<String, dynamic> parameters;

  PagedDoctorsListView(this.parameters, {required this.onDoctorsClicked});

  @override
  _PagedDoctorsItemsListViewViewState createState() =>
      _PagedDoctorsItemsListViewViewState();
}

class _PagedDoctorsItemsListViewViewState extends State<PagedDoctorsListView> {
  _PagedDoctorsItemsListViewViewState();

  final ScrollController? controller = ScrollController();

  final _pagingController = PagingController<int, Doctor>(
    firstPageKey: 1,
  );

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    super.initState();
  }

  @override
  void didUpdateWidget(PagedDoctorsListView oldWidget) {
    _pagingController.refresh();

    super.didUpdateWidget(oldWidget);
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      var parameters = widget.parameters;

      parameters.putIfAbsent(EndPointParameter.PAGE, () => pageKey.toString());
      parameters[EndPointParameter.PAGE] = pageKey.toString();

      var items =
          await locator<DoctorsRepository>().fetchDoctorsList(parameters);

      if (items.isEmpty) {
        _pagingController.appendLastPage(items);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(items, nextPageKey);
      }
    } catch (error) {
      // print(error);
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DoctorsListViewModel>.reactive(
        viewModelBuilder: () => DoctorsListViewModel(),
        builder: (context, model, child) => PagedListView.separated(
              physics: BouncingScrollPhysics(),
              scrollController: controller,
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Doctor>(
                itemBuilder: (context, doctor, index) => DoctorTile(
                  doctor: doctor,
                  onChanged: (value) {},
                ),
                firstPageProgressIndicatorBuilder: (context) =>
                    LoadingCircularProgressIndicator(),
                newPageProgressIndicatorBuilder: (context) =>
                    LoadingCircularProgressIndicator(),
                firstPageErrorIndicatorBuilder: (context) => ErrorIndicator(
                  error: _pagingController.error,
                  onTryAgain: () => _pagingController.refresh(),
                ),
                noItemsFoundIndicatorBuilder: (context) => EmptyListIndicator(
                  title: '${AppLocalizations.of(context).empty_list}', //
                  message: '${AppLocalizations.of(context).empty_list}', //
                ),
              ),
              padding: const EdgeInsets.all(4),
              separatorBuilder: (context, index) => const SizedBox(
                height: 0,
              ),
            ));
  }
}
