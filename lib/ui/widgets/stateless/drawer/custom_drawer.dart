// import 'package:movieapp_faisal/components/drawer/bottom_user_info.dart';
// import 'package:movieapp_faisal/components/drawer/custom_list_tile.dart';
// import 'package:movieapp_faisal/components/drawer/header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/generated/l10n.dart';
import 'package:movieapp/ui/views/home_page/home_page.dart';
import 'package:movieapp/ui/views/home_page/home_page_view_model.dart';
import 'package:movieapp/ui/views/settings/settings_view.dart';
import 'package:movieapp/ui/widgets/stateless/drawer/upper_user_info.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/constants.dart';
import '../../../views/login and signup/login_page.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageModel>.reactive(
        viewModelBuilder: () => HomePageModel(),
        onModelReady: (model) async {
          await model.init(context);
        },
        builder: (context, model, child) => SafeArea(
              child: AnimatedContainer(
                curve: Curves.easeInOutCubic,
                duration: const Duration(milliseconds: 250),
                width: 150,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    UpperUserInfo(),
                    ListTile(
                      title: Text(
                        ' الرئيسية',
                        style: GoogleFonts.cairo(
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                            color: HexColor.fromHex(
                                Constants.app_color_on_secondary),
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      }),
                    ),
                    ListTile(
                      title: Text(
                        ' عن التطبيق ',
                        style: GoogleFonts.cairo(
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                            color: HexColor.fromHex(
                                Constants.app_color_on_secondary),
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: (() {}),
                    ),
                    ListTile(
                      title: Text(
                        "تسجيل الطبيب",
                        style: GoogleFonts.cairo(
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                            color: HexColor.fromHex(
                                Constants.app_color_on_secondary),
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsView()),
                        );
                      }),
                    ),
                    /* Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "-----------------------------------",
                        style: GoogleFonts.cairo(
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                            color: HexColor.fromHex(
                                Constants.app_color_on_secondary),
                            fontWeight: FontWeight.bold),
                      ),
                    ),*/
                    ListTile(
                      title: Text(
                        "تواصل معنا",
                        style: GoogleFonts.cairo(
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                            color: HexColor.fromHex(
                                Constants.app_color_on_secondary),
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: (() {}),
                    ),
                    ListTile(
                      title: Text(
                        ' تسجيل الخروج ',
                        style: GoogleFonts.cairo(
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                            color: HexColor.fromHex(
                                Constants.app_color_on_secondary),
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: (() {
                        // model.clear();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      }),
                    ),
                    SizedBox(height: 80),
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Expanded(
                        flex: 2,
                        child: Container(
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
                      ),
                    ),
                    /*  Text(
                      ' طبيبي',
                      style: GoogleFonts.cairo(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          color: HexColor.fromHex(
                              Constants.app_color_on_secondary),
                          fontWeight: FontWeight.bold),
                    ),*/
                  ],
                ),
              ),
            ));
  }
}
