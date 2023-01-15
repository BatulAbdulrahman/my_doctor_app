import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/ui/views/clinics_list/paged_clinics_list_view.dart';
import 'package:movieapp/ui/views/doctors_list/paged_doctors_list_view.dart';
import 'package:movieapp/ui/views/home_page/home_page.dart';
import 'package:movieapp/ui/widgets/stateless/drawer/custom_drawer.dart';
import 'package:stacked/stacked.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/constants.dart';
import '../../widgets/stateless/indicators/loading_circular_progress_indicator.dart';
import 'clinics_list_view_model.dart';

class ClinicsListView extends StatefulWidget {
  ClinicsListView();

  @override
  _ClinicsListViewState createState() => _ClinicsListViewState();
}

class _ClinicsListViewState extends State<ClinicsListView>
    with SingleTickerProviderStateMixin {
  @override
  void didUpdateWidget(ClinicsListView oldWidget) {
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

    return ViewModelBuilder<ClinicsListViewModel>.reactive(
      viewModelBuilder: () => ClinicsListViewModel(),
      onModelReady: (model) async {
        await model.init(context);
      },
      builder: (context, model, child) {
        return Scaffold(
            key: _scaffoldKey,
            backgroundColor: Color(0xFFFAFAFA),
            drawer: Drawer(
              width: 300,
              elevation: 0,
              child: Expanded(child: CustomDrawer()),
            ),
            appBar: AppBar(
              backgroundColor: Color(0xFFFAFAFA),
              elevation: 0,
              leading: IconButton(
                  alignment: Alignment.bottomLeft,
                  color: AppColors.app_color_primary,
                  icon: Icon(Icons.keyboard_arrow_right_outlined),
                  iconSize: 30,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  }),
              title: Center(
                child: Text(
                  "المصحات",
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
                                        hintText: ' بحث عن مصحة',
                                        hintStyle: GoogleFonts.cairo(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15,
                                          color: HexColor.fromHex(Constants
                                                  .app_color_on_secondary)
                                              .withOpacity(0.5),
                                        ),
                                        fillColor: HexColor.fromHex(
                                            Constants.app_color_on_primary),
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 0.5,
                                              strokeAlign: StrokeAlign.inside,
                                              color: HexColor.fromHex(
                                                  Constants.app_color_primary),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: HexColor.fromHex(
                                                  Constants.app_color_secondary)
                                              .withOpacity(0.5),
                                        )),
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
                            child: PagedClinicsListView(
                              {
                                if (model.q!.isNotEmpty) 'q': model.q!,
                                if (model.selected_clinic != null)
                                  'filters':
                                      'clinic:[${model.selected_clinic!.id}]'
                              },
                              onClinicsClicked: (move) {},
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
