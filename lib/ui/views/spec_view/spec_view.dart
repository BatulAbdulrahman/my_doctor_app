import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/core/models/specialization/specialization.dart';
import 'package:movieapp/ui/views/clinic_view/clinic_view_model.dart';
import 'package:movieapp/ui/views/doctors_list/doctors_list_view.dart';
import 'package:movieapp/ui/views/spec_view/spec_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/constants.dart';
import '../../shared/ui_helper.dart';

import '../../widgets/stateless/drawer/custom_drawer.dart';
import '../../widgets/stateless/indicators/loading_circular_progress_indicator.dart';
import '../../widgets/stateless/star_display.dart';

import '../doctor_view/doctor_view.dart';
import '../doctors_list/paged_doctors_list_view.dart';
import '../specs_list/specs_list_view.dart';

// ignore: must_be_immutable
class SpecView extends StatefulWidget {
  Specialization specialization;

  SpecView(this.specialization);

  @override
  _SpecViewState createState() => _SpecViewState();
}

class _SpecViewState extends State<SpecView>
    with SingleTickerProviderStateMixin {
  @override
  void didUpdateWidget(SpecView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  TextEditingController? commentController;
  FocusNode? commentFocusNode;

  @override
  void initState() {
    super.initState();

    commentController = TextEditingController();

    commentFocusNode = FocusNode();
  }

  @override
  void dispose() {
    commentController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SpecViewModel>.reactive(
      viewModelBuilder: () => SpecViewModel(),
      onModelReady: (model) async {
        await model.init(context, widget.specialization);
      },
      builder: (context, model, child) => model.isBusy
          ? Scaffold(body: LoadingCircularProgressIndicator())
          : Scaffold(
              // key: _scaffoldKey,
              backgroundColor: Color(0xFFcfdfda),
              drawer: Drawer(
                width: 300,
                elevation: 0,
                child: Expanded(child: CustomDrawer()),
              ),
              appBar: AppBar(
                backgroundColor: Color(0xFFcfdfda),
                elevation: 0,
                leading: IconButton(
                    alignment: Alignment.bottomLeft,
                    color: AppColors.app_color_primary,
                    icon: Icon(Icons.keyboard_arrow_right_outlined),
                    iconSize: 30,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SpecsListView()),
                      );
                    }),
                centerTitle: true,
                title: Text(
                  widget.specialization.name!,
                  style: GoogleFonts.cairo(
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      color: HexColor.fromHex(Constants.app_color_on_secondary),
                      fontWeight: FontWeight.bold),
                ),
              ),
              body: model.isBusy
                  ? LoadingCircularProgressIndicator()
                  : Column(
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
                                        hintText:
                                            'البحـث عن طبيـب ${widget.specialization.name} ',
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
                        UIHelper.verticalSpaceMedium(),
                        SingleChildScrollView(
                          child: Column(
                            //scrollDirection: Axis.vertical,
                            children: widget.specialization.doctors!
                                .map((item) => InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DoctorView(
                                                  widget.specialization.doctors!
                                                      .first)),
                                        );
                                      },
                                      child: Card(
                                        elevation: 3,
                                        margin: EdgeInsets.all(10),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              8,
                                          child: Center(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    //color: Colors.r,
                                                    child: Image.network(
                                                      item.thumb ??
                                                          'https://woodfibreinsulation.co.uk/wp-content/uploads/2017/04/blank-profile-picture-973460-1-1.png',
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                    flex: 3,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10,
                                                              right: 15),
                                                      child: Column(
                                                        children: [
                                                          UIHelper
                                                              .verticalSpaceLarge(),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  item.name!,
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: GoogleFonts.cairo(
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      fontSize:
                                                                          15,
                                                                      color: HexColor.fromHex(
                                                                          Constants
                                                                              .app_color_on_secondary),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                              UIHelper
                                                                  .horizontalSpaceSmall(),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  item
                                                                      .Specializations!
                                                                      .first
                                                                      .name!,
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: GoogleFonts.cairo(
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      fontSize:
                                                                          15,
                                                                      color: HexColor.fromHex(
                                                                          Constants
                                                                              .app_color_on_secondary),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                              UIHelper
                                                                  .horizontalSpaceSmall(),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                                UIHelper.horizontalSpaceSmall(),
                                                Expanded(
                                                    flex: 3,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 3,
                                                              left: 30,
                                                              right: 5),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: [
                                                          UIHelper
                                                              .verticalSpaceLarge(),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Expanded(
                                                                child: Center(
                                                                  child: Text(
                                                                    "التقييم",
                                                                    style: GoogleFonts
                                                                        .cairo(
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      fontSize:
                                                                          12,
                                                                      color: HexColor.fromHex(
                                                                          Constants
                                                                              .app_color_on_secondary),
                                                                      //fontWeight: FontWeight.bold
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              UIHelper
                                                                  .horizontalSpaceSmall(),
                                                            ],
                                                          ),
                                                          UIHelper
                                                              .horizontalSpaceMedium(),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                  child: Center(
                                                                child:
                                                                    IconTheme(
                                                                  data:
                                                                      IconThemeData(
                                                                    color: HexColor.fromHex(
                                                                        Constants
                                                                            .app_color_secondary),
                                                                    size: 20,
                                                                  ),
                                                                  child: StarDisplay(
                                                                      value: item
                                                                          .rating!),
                                                                ),
                                                              )),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                                // UIHelper.verticalSpaceSmall(),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        )
                      ],
                    )),
    );
  }
}
