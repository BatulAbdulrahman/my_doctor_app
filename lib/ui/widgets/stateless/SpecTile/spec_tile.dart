import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/core/models/specialization/specialization.dart';
import 'package:movieapp/ui/views/clinic_view/clinic_view.dart';
import 'package:movieapp/ui/views/spec_view/spec_view.dart';
import 'package:movieapp/ui/widgets/stateless/Clinic_tile/clinic_tile_view_model.dart';
import 'package:movieapp/ui/widgets/stateless/SpecTile/spec_tile_view_model.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/constants.dart';
import '../../../../core/models/clinic/clinic.dart';
import '../../../shared/ui_helper.dart';
import '../../../views/Home_page/home_page.dart';
import '../star_display.dart';

/// A list tile for an article.
class SpecTile extends StatelessWidget {
  final Specialization specialization;
  final ValueChanged<Specialization> onChanged;

  const SpecTile({required this.specialization, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SpecTileViewModel>.nonReactive(
      viewModelBuilder: () => SpecTileViewModel(),
      onModelReady: (model) => model.init(specialization),
      builder: (context, model, child) => InkWell(
          /* onTap: () async {
          model.moveToClinicViewRoute(context);
        },*/
          child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            mainAxisExtent: 120,
            childAspectRatio: 1),
        // ignore: sort_child_properties_last
        children: [
          InkWell(
            onTap: (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SpecView(specialization)),
              );
            }),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0 / 2,
                vertical: 16.0 / 2,
              ),
              decoration: BoxDecoration(
                color: HexColor.fromHex(Constants.app_color_on_primary),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: HexColor.fromHex(Constants.app_color_secondary)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.0 / 2),
                    height: 60,
                    width: 75,
                    decoration: BoxDecoration(
                        color:
                            HexColor.fromHex(Constants.app_color_on_secondary)
                                .withOpacity(0.1),
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.people,
                      color: HexColor.fromHex(Constants.app_color_secondary),
                    ),
                  ),
                  Text(
                    specialization.name!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.cairo(
                        fontStyle: FontStyle.normal,
                        fontSize: 15,
                        color:
                            HexColor.fromHex(Constants.app_color_on_secondary),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0 / 2,
              vertical: 16.0 / 2,
            ),
            decoration: BoxDecoration(
              color: HexColor.fromHex(Constants.app_color_on_primary),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: HexColor.fromHex(Constants.app_color_secondary)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(16.0 / 2),
                  height: 60,
                  width: 75,
                  decoration: BoxDecoration(
                      color: HexColor.fromHex(Constants.app_color_on_secondary)
                          .withOpacity(0.1),
                      shape: BoxShape.circle),
                  child: Icon(
                    Icons.people,
                    color: HexColor.fromHex(Constants.app_color_secondary),
                  ),
                ),
                Text(
                  specialization.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.cairo(
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                      color: HexColor.fromHex(Constants.app_color_on_secondary),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
        shrinkWrap: true,
        padding: EdgeInsets.all(10),
      )),
    );
  }
}
