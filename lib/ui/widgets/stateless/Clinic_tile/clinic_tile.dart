import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/ui/widgets/stateless/Clinic_tile/clinic_tile_view_model.dart';
import 'package:movieapp/ui/widgets/stateless/Doctor_tile/doctor_tile_view_model.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/constants.dart';
import '../../../../core/models/clinic/clinic.dart';
import '../../../../core/models/doctor/doctor.dart';
import '../../../shared/themes.dart';
import '../../../shared/ui_helper.dart';
import '../../../views/Home_page/home_page.dart';
import '../star_display.dart';

/// A list tile for an article.
class ClinicTile extends StatelessWidget {
  final Clinic clinic;
  final ValueChanged<Clinic> onChanged;

  const ClinicTile({required this.clinic, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ClinicTileViewModel>.nonReactive(
      viewModelBuilder: () => ClinicTileViewModel(),
      onModelReady: (model) => model.init(clinic),
      builder: (context, model, child) => InkWell(
        /* onTap: () async {
          model.moveToClinicViewRoute(context);
        },*/
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
                                        clinic.name!,
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
                                      clinic.location!,
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
                      IconButton(
                          alignment: Alignment.bottomLeft,
                          color: AppColors.app_color_primary,
                          icon: Icon(Icons.arrow_back_ios_new_outlined),
                          iconSize: 25,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          }),
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
