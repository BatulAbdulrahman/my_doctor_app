import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/ui/views/doctors_list/doctors_list_view.dart';
import 'package:stacked/stacked.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/constants.dart';
import '../../../core/models/doctor/doctor.dart';
import '../../shared/primary_button.dart';
import '../../shared/ui_helper.dart';
import '../../widgets/stateless/drawer/custom_drawer.dart';
import '../../widgets/stateless/indicators/loading_circular_progress_indicator.dart';
import '../../widgets/stateless/star_display.dart';
import 'doctor_view_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore: must_be_immutable
class DoctorView extends StatefulWidget {
  Doctor doctor;

  DoctorView(this.doctor);

  @override
  _DoctorViewState createState() => _DoctorViewState();
}

class _DoctorViewState extends State<DoctorView>
    with SingleTickerProviderStateMixin {
  @override
  void didUpdateWidget(DoctorView oldWidget) {
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
    return ViewModelBuilder<DoctorViewModel>.reactive(
      viewModelBuilder: () => DoctorViewModel(),
      onModelReady: (model) async {
        await model.init(context, widget.doctor);
      },
      builder: (context, model, child) => model.isBusy
          ? Scaffold(body: LoadingCircularProgressIndicator())
          : Scaffold(
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
                            builder: (context) => DoctorsListView()),
                      );
                    }),
                centerTitle: true,
                title: Text(
                  'بيـانـات الطبـيب',
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
                        Card(
                          elevation: 5,
                          margin: EdgeInsets.all(10),
                          child: Container(
                              height: MediaQuery.of(context).size.height / 5,
                              child: Column(
                                children: [
                                  Center(
                                      child: Row(children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        child: Image.network(
                                          widget.doctor.thumb ??
                                              'https://woodfibreinsulation.co.uk/wp-content/uploads/2017/04/blank-profile-picture-973460-1-1.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 3,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 15),
                                          child: Column(
                                            children: [
                                              UIHelper.verticalSpaceLarge(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      widget.doctor.name!,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.cairo(
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 15,
                                                          color: HexColor
                                                              .fromHex(Constants
                                                                  .app_color_on_secondary),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  UIHelper
                                                      .horizontalSpaceSmall(),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  //Text("Genre here"),
                                                  Text(
                                                    widget
                                                        .doctor
                                                        .Specializations!
                                                        .first
                                                        .name!,
                                                    style: GoogleFonts.cairo(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 12,
                                                      color: HexColor.fromHex(
                                                          Constants
                                                              .app_color_on_secondary),
                                                      //fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                  //UIHelper.horizontalSpaceSmall(),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )),
                                    UIHelper.horizontalSpaceSmall(),
                                    Expanded(
                                        flex: 3,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 3, left: 30, right: 5),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              UIHelper.verticalSpaceLarge(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Center(
                                                      child: Text(
                                                        'التقييم',
                                                        style:
                                                            GoogleFonts.cairo(
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 12,
                                                          color: HexColor
                                                              .fromHex(Constants
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
                                              UIHelper.horizontalSpaceMedium(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                      child: Center(
                                                    child: IconTheme(
                                                      data: IconThemeData(
                                                        color: HexColor.fromHex(
                                                            Constants
                                                                .app_color_secondary),
                                                        size: 20,
                                                      ),
                                                      child: StarDisplay(
                                                          value: widget
                                                              .doctor.rating!),
                                                    ),
                                                  )),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )),
                                    // UIHelper.verticalSpaceSmall(),
                                  ])),
                                  UIHelper.verticalSpaceMedium(),
                                  PrimaryButton(
                                      press: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  title: Text(
                                                    'قيم الطبـيب',
                                                    style: GoogleFonts.cairo(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 12,
                                                      color: HexColor.fromHex(
                                                          Constants
                                                              .app_color_on_secondary),
                                                      // fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                  actions: [
                                                    Expanded(
                                                      child: RatingBar.builder(
                                                        minRating: 1,
                                                        maxRating: 5,
                                                        itemSize: 25,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: false,
                                                        itemCount: 5,
                                                        itemPadding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    2.0),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                Icon(
                                                          Icons.star,
                                                          size: 5,
                                                          color: Colors.amber,
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {
                                                          model.rating =
                                                              rating.toInt();
                                                          print(model.rating);
                                                        },
                                                      ),
                                                    ),
                                                    ElevatedButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                horizontal:
                                                                    7.0 * 1.5,
                                                                vertical: 7.0,
                                                              ),
                                                              backgroundColor:
                                                                  HexColor.fromHex(
                                                                      Constants
                                                                          .app_color_secondary)),
                                                      onPressed: () {
                                                        if (model.rating > 0) {
                                                          model.sendReview(
                                                              model.rating);
                                                          //model.getUser();
                                                          print(model.rating);
                                                        }
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  DoctorView(model
                                                                      .doctor!)),
                                                        );
                                                      },
                                                      child: Text(
                                                        'قيـم',
                                                        style: GoogleFonts.cairo(
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 15,
                                                            color: HexColor
                                                                .fromHex(Constants
                                                                    .app_color_on_primary),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                      ),
                                                    ),
                                                  ],
                                                ));
                                      },
                                      buttonText: 'قيـم الطبيـب'),
                                ],
                              )),
                        ),
                        UIHelper.verticalSpaceMedium(),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              ' الوصـف الوظيـفي',
                              style: GoogleFonts.cairo(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20,
                                  color: HexColor.fromHex(
                                      Constants.app_color_on_secondary),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        UIHelper.verticalSpaceMedium(),
                        Card(
                          elevation: 5,
                          margin: EdgeInsets.all(10),
                          child: Container(
                              height: MediaQuery.of(context).size.height / 8,
                              child: Center(
                                  child: Row(children: [
                                Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 15),
                                      child: Column(
                                        children: [
                                          UIHelper.verticalSpaceLarge(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  widget.doctor.description!,
                                                  maxLines: 10,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.cairo(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 15,
                                                      color: HexColor.fromHex(
                                                          Constants
                                                              .app_color_on_secondary),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              UIHelper.horizontalSpaceSmall(),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                                UIHelper.horizontalSpaceSmall(),
                              ]))),
                        ),
                        UIHelper.verticalSpaceMedium(),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'جـدول العمـل',
                              style: GoogleFonts.cairo(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20,
                                  color: HexColor.fromHex(
                                      Constants.app_color_on_secondary),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        UIHelper.verticalSpaceMedium(),
                        Card(
                          color: HexColor.fromHex(Constants.app_color_primary),
                          elevation: 6,
                          margin: EdgeInsets.all(10),
                          child: Container(
                              height: MediaQuery.of(context).size.height / 12,
                              child: Center(
                                  child: Row(children: [
                                Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: Column(
                                        children: [
                                          UIHelper.verticalSpaceLarge(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    widget.doctor.clinics!.first
                                                        .day!,
                                                    maxLines: 10,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.cairo(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 15,
                                                        color:
                                                            Color(0xFFFAFAFA),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                //UIHelper.horizontalSpaceSmall(),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                UIHelper.horizontalSpaceSmall(),
                                Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: Column(
                                        children: [
                                          UIHelper.verticalSpaceLarge(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  widget.doctor.clinics!.first
                                                      .name!,
                                                  maxLines: 10,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.cairo(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 15,
                                                      color: Color(0xFFFAFAFA),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                                Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 45),
                                      child: Column(
                                        children: [
                                          UIHelper.verticalSpaceLarge(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    widget.doctor.clinics!.first
                                                        .time!,
                                                    maxLines: 10,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.cairo(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 15,
                                                        color:
                                                            Color(0xFFFAFAFA),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ]))),
                        ),
                      ],
                    )),
    );
  }
}
