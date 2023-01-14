import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/ui/views/doctors_list/paged_doctors_list_view.dart';
import 'package:movieapp/ui/widgets/stateless/drawer/custom_drawer.dart';
import 'package:stacked/stacked.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/constants.dart';
import '../../widgets/stateless/indicators/loading_circular_progress_indicator.dart';
import 'doctors_list_view_model.dart';

class DoctorsListView extends StatefulWidget {
  DoctorsListView();

  @override
  _DoctorsListViewState createState() => _DoctorsListViewState();
}

class _DoctorsListViewState extends State<DoctorsListView>
    with SingleTickerProviderStateMixin {
  @override
  void didUpdateWidget(DoctorsListView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

    return ViewModelBuilder<DoctorsListViewModel>.reactive(
      viewModelBuilder: () => DoctorsListViewModel(),
      onModelReady: (model) async {
        await model.init(context);
      },
      builder: (context, model, child) {
        return Scaffold(
            key: _scaffoldKey,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            drawer: Drawer(
              width: 300,
              elevation: 0,
              child: Expanded(child: CustomDrawer()),
            ),
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              elevation: 0,
              leading: IconButton(
                color: AppColors.app_color_on_primary,
                icon: Icon(Icons.menu),
                onPressed: () => _scaffoldKey.currentState!.openDrawer(),
              ),
              title: Center(
                child: Text(
                  "الأطباء",
                  style: GoogleFonts.cairo(
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      color: HexColor.fromHex(Constants.app_color_on_secondary),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            body: model.isBusy
                ? LoadingCircularProgressIndicator()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 8),
                          child: Row(
                            children: [
                              // ActorsSearch(),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.search),
                                        hintStyle: TextStyle(fontSize: 14),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        hintText: 'Search'),
                                    onChanged: (value) {
                                      model.q = value;
                                      model.notifyListeners();
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: PagedDoctorsListView(
                              {
                                if (model.q!.isNotEmpty) 'q': model.q!,
                                if (model.selected_doctor != null)
                                  'filters':
                                      'doctors:[${model.selected_doctor!.id}]'
                              },
                              onDoctorsClicked: (move) {},
                            ),
                          ),
                        )
                      ],
                    ))); // ActorsCards(model.actors_list..shuffle()));
        // body: ListView(
        //   children: model.actors_list.map((e) => ActorsCards(e)).toList(),
        // ));
      },
    );
  }
}
