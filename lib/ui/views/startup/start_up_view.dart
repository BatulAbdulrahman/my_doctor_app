import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/asset_images.dart';
import '../../../core/constant/constants.dart';
import '/ui/views/startup/start_up_view_model.dart';
import '/ui/widgets/stateless/app_logo.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: () => StartUpViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(context),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  HexColor.fromHex(Constants.app_color_primary),
                  HexColor.fromHex(Constants.app_color_primary_variant),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(80),
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/طبيبي-removebg-preview.png'))),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'طـبـيـبي',
                    style: GoogleFonts.cairo(
                        fontStyle: FontStyle.normal,
                        fontSize: 26,
                        color: HexColor.fromHex(Constants.app_color_on_primary),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // model.isBusy
                //     ? SizedBox(
                //         width: 25,
                //         height: 25,
                //         child: CircularProgressIndicator(
                //           color:
                //               HexColor.fromHex(Constants.app_color_on_primary),
                //         ),
                //       )
                //     : Container(),
                Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
