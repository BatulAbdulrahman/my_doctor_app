import 'dart:async';

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieapp/core/models/specialization/specialization.dart';
import 'package:stacked/stacked.dart';

import '../../../core/repositories/specializations_repository/specializations_repository.dart';
import '../../../generated/l10n.dart';
import '../../widgets/stateless/SpecTile/spec_tile.dart';
import '/core/constant/end_point_parameters.dart';
import '../../../../locator.dart';
import '../../widgets/stateless/indicators/empty_list_indicator.dart';
import '../../widgets/stateless/indicators/error_indicator.dart';
import '../../widgets/stateless/indicators/loading_circular_progress_indicator.dart';

import 'specs_list_view_model.dart';

// ignore: must_be_immutable
class PagedSpecsListView extends StatefulWidget {
  final ValueChanged<Specialization> onSpecsClicked;
  Map<String, dynamic> parameters;

  PagedSpecsListView(this.parameters, {required this.onSpecsClicked});

  @override
  _PagedSpecsItemsListViewViewState createState() =>
      _PagedSpecsItemsListViewViewState();
}

class _PagedSpecsItemsListViewViewState extends State<PagedSpecsListView> {
  _PagedSpecsItemsListViewViewState();

  final ScrollController? controller = ScrollController();

  final _pagingController = PagingController<int, Specialization>(
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
  void didUpdateWidget(PagedSpecsListView oldWidget) {
    _pagingController.refresh();

    super.didUpdateWidget(oldWidget);
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      var parameters = widget.parameters;

      parameters.putIfAbsent(EndPointParameter.PAGE, () => pageKey.toString());
      parameters[EndPointParameter.PAGE] = pageKey.toString();

      var items = await locator<SpecializationsRepository>()
          .fetchSpecializationsList(parameters);

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
    return ViewModelBuilder<SpecsListViewModel>.reactive(
        viewModelBuilder: () => SpecsListViewModel(),
        builder: (context, model, child) => PagedListView.separated(
              physics: BouncingScrollPhysics(),
              scrollController: controller,
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Specialization>(
                itemBuilder: (context, spec, index) => SpecTile(
                  specialization: spec,
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
