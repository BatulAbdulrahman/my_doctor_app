import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/ui/widgets/stateless/Doctor_tile/doctor_tile_view_model.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/constants.dart';
import '../../../../core/models/doctor/doctor.dart';
import '../../../shared/themes.dart';
import '../../../shared/ui_helper.dart';
import '../star_display.dart';

/// A list tile for an article.
class DoctorTile extends StatelessWidget {
  final Doctor doctor;
  final ValueChanged<Doctor> onChanged;

  const DoctorTile({required this.doctor, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DoctorTileViewModel>.nonReactive(
      viewModelBuilder: () => DoctorTileViewModel(),
      onModelReady: (model) => model.init(doctor),
      builder: (context, model, child) => InkWell(
        onTap: () async {
          model.moveToDoctorViewRoute(context);
        },
        child: SingleChildScrollView(
          child: Expanded(
            child: Card(
              elevation: 3,
              margin: EdgeInsets.all(10),
              child: Container(
                height: MediaQuery.of(context).size.height / 8,
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          //color: Colors.r,
                          child: Image.network(
                            doctor.thumb ??
                                'https://woodfibreinsulation.co.uk/wp-content/uploads/2017/04/blank-profile-picture-973460-1-1.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 15),
                            child: Column(
                              children: [
                                UIHelper.verticalSpaceLarge(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        doctor.name!,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.cairo(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 15,
                                            color: HexColor.fromHex(Constants
                                                .app_color_on_secondary),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    UIHelper.horizontalSpaceSmall(),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    //Text("Genre here"),
                                    Text(
                                      doctor.Specializations!.first.name!,
                                      style: GoogleFonts.cairo(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12,
                                        color: HexColor.fromHex(
                                            Constants.app_color_on_secondary),
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                UIHelper.verticalSpaceLarge(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          "التقييم",
                                          style: GoogleFonts.cairo(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12,
                                            color: HexColor.fromHex(Constants
                                                .app_color_on_secondary),
                                            //fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    ),
                                    UIHelper.horizontalSpaceSmall(),
                                  ],
                                ),
                                UIHelper.horizontalSpaceMedium(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Center(
                                      child: IconTheme(
                                        data: IconThemeData(
                                          color: HexColor.fromHex(
                                              Constants.app_color_secondary),
                                          size: 20,
                                        ),
                                        child:
                                            StarDisplay(value: doctor.rating!),
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
          ),
        ),
      ),
    );
  }
}
