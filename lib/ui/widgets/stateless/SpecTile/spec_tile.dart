import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/core/models/specialization/specialization.dart';
import 'package:movieapp/ui/views/spec_view/spec_view.dart';
import 'package:movieapp/ui/widgets/stateless/SpecTile/spec_tile_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/constants.dart';
import '../../../shared/ui_helper.dart';

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
        onTap: () async {
          model.moveToSpecsViewRoute(context);
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
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 15),
                            child: Row(
                              children: [
                                UIHelper.verticalSpaceLarge(),
                                Container(
                                  padding: EdgeInsets.all(16.0 / 2),
                                  height: 60,
                                  width: 75,
                                  decoration: BoxDecoration(
                                      color: HexColor.fromHex(
                                              Constants.app_color_on_secondary)
                                          .withOpacity(0.1),
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.people,
                                    color: HexColor.fromHex(
                                        Constants.app_color_secondary),
                                  ),
                                ),
                                Text(
                                  specialization.name!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.cairo(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15,
                                      color: HexColor.fromHex(
                                          Constants.app_color_on_secondary),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )),
                      IconButton(
                          alignment: Alignment.bottomLeft,
                          color:
                              HexColor.fromHex(Constants.app_color_secondary),
                          icon: Icon(Icons.arrow_back_ios_new_outlined),
                          iconSize: 25,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SpecView(specialization)),
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
