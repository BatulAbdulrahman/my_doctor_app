// import 'package:movieapp_faisal/components/drawer/bottom_user_info.dart';
// import 'package:movieapp_faisal/components/drawer/custom_list_tile.dart';
// import 'package:movieapp_faisal/components/drawer/header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/ui/views/contact_us/contact_us_view.dart';
import 'package:movieapp/ui/views/home_page/home_page.dart';
import 'package:movieapp/ui/views/home_page/home_page_view_model.dart';
import 'package:movieapp/ui/widgets/stateless/drawer/upper_user_info.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/constants.dart';
import '../../../views/about_app/about_app_view.dart';
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
                color: HexColor.fromHex(Constants.app_color_primary),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    UpperUserInfo(),
                    ListTile(
                      leading: Icon(
                        Icons.home_outlined,
                        color: HexColor.fromHex(Constants.app_color_on_primary),
                      ),
                      title: Text(
                        'الرئـيسـية',
                        style: GoogleFonts.cairo(
                            fontStyle: FontStyle.normal,
                            fontSize: 16,
                            color: HexColor.fromHex(
                                Constants.app_color_on_primary),
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
                      leading: Icon(
                        Icons.phone_iphone_outlined,
                        color: HexColor.fromHex(Constants.app_color_on_primary),
                      ),
                      title: Text(
                        'عـن التـطبيـق',
                        style: GoogleFonts.cairo(
                            fontStyle: FontStyle.normal,
                            fontSize: 16,
                            color: HexColor.fromHex(
                                Constants.app_color_on_primary),
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdoutAppView()),
                        );
                      }),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.add_outlined,
                        color: HexColor.fromHex(Constants.app_color_on_primary),
                      ),
                      title: Text(
                        'تسجيـل طبـيب',
                        style: GoogleFonts.cairo(
                            fontStyle: FontStyle.normal,
                            fontSize: 16,
                            color: HexColor.fromHex(
                                Constants.app_color_on_primary),
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactUsView()),
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Divider(
                        color: HexColor.fromHex(Constants.app_color_on_primary)
                            .withOpacity(0.5),
                        thickness: 1,
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.phone_outlined,
                        color: HexColor.fromHex(Constants.app_color_on_primary),
                      ),
                      title: Text(
                        'تواصـل معنـا',
                        style: GoogleFonts.cairo(
                            fontStyle: FontStyle.normal,
                            fontSize: 16,
                            color: HexColor.fromHex(
                                Constants.app_color_on_primary),
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactUsView()),
                        );
                      }),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.logout_outlined,
                        color: HexColor.fromHex(Constants.app_color_on_primary),
                      ),
                      title: Text(
                        ' تسجيـل الخـروج ',
                        style: GoogleFonts.cairo(
                            fontStyle: FontStyle.normal,
                            fontSize: 16,
                            color: HexColor.fromHex(
                                Constants.app_color_on_primary),
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      }),
                    ),
                    SizedBox(height: 80),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(80),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/طبيبي-removebg-preview.png'))),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ));
  }
}
