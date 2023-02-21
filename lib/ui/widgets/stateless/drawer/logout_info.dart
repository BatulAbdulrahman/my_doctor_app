import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/ui/views/Home_page/home_page.dart';
import 'package:movieapp/ui/views/login%20and%20signup/login_page.dart';
import 'package:movieapp/ui/widgets/stateless/drawer/upper_userViewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/constants.dart';
import '/ui/views/startup/start_up_view_model.dart';
import '/ui/widgets/stateless/app_logo.dart';

class LogoutInfo extends StatefulWidget {
  const LogoutInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<LogoutInfo> createState() => _LogoutInfoState();
}

class _LogoutInfoState extends State<LogoutInfo> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UpperUserViewModel>.reactive(
        viewModelBuilder: () => UpperUserViewModel(),
        onModelReady: (model) async {
          await model.init(context);
        },
        builder: (context, model, child) => AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: HexColor.fromHex(Constants.app_color_primary),
              borderRadius: BorderRadius.circular(0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    //   alignment: Alignment.bottomLeft,
                    // color: HexColor.fromHex(Constants.app_color_on_primary),
                    icon: Icon(
                      Icons.logout_outlined,
                      color: HexColor.fromHex(Constants.app_color_on_primary),
                    ),
                    iconSize: 30,
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: InkWell(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Visibility(
                        visible: model.isLoggedIn!,
                        child: Text(
                          ' تسجيـل الخـروج ',
                          style: GoogleFonts.cairo(
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              color: HexColor.fromHex(
                                  Constants.app_color_on_primary),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
