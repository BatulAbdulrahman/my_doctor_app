import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:movieapp/core/services/key_storage/key_storage_service.dart';
import 'package:movieapp/generated/l10n.dart';
import 'package:movieapp/ui/views/contact_us/contact_us_view_model.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/constants.dart';
import '../../widgets/stateless/drawer/custom_drawer.dart';
import '../Home_page/home_page.dart';
import '/ui/shared/ui_helper.dart';
import '/ui/widgets/stateless/app_bar.dart';
import '../../../locator.dart';
import '../../widgets/stateless/app_logo.dart';

class ContactUsView extends StatefulWidget {
  @override
  _ContactUsViewState createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  final formKey = GlobalKey<FormState>();
  int click_count = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactUsViewModel>.reactive(
      viewModelBuilder: () => ContactUsViewModel(),
      onModelReady: (model) async {
        await model.init(context);
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: Color(0xFFcfdfda),
        drawer: Drawer(
          width: 300,
          elevation: 0,
          child: Expanded(child: CustomDrawer()),
        ),
        appBar: AppBar(
          centerTitle: true,
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
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              }),
          title: Text(
            'تواصـل معنـا',
            style: GoogleFonts.cairo(
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: HexColor.fromHex(Constants.app_color_on_secondary),
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 250.0,
                      width: 350.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3.0,
                            color: Colors.grey,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 18.0, right: 18.0, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(
                                  Icons.phone_outlined,
                                  color: HexColor.fromHex(
                                      Constants.app_color_primary),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  '00-281-921111111',
                                  textDirection: TextDirection.rtl,
                                  style: GoogleFonts.cairo(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18,
                                      color: HexColor.fromHex(
                                          Constants.app_color_on_secondary),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Divider(
                                color: HexColor.fromHex(
                                        Constants.app_color_primary)
                                    .withOpacity(0.5),
                                thickness: 1,
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(
                                  Icons.phone_outlined,
                                  color: HexColor.fromHex(
                                      Constants.app_color_primary),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  '00-281-912222222',
                                  textDirection: TextDirection.rtl,
                                  style: GoogleFonts.cairo(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18,
                                      color: HexColor.fromHex(
                                          Constants.app_color_on_secondary),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Divider(
                                color: HexColor.fromHex(
                                        Constants.app_color_primary)
                                    .withOpacity(0.5),
                                thickness: 1,
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(
                                  Icons.email_outlined,
                                  color: HexColor.fromHex(
                                      Constants.app_color_primary),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'info@tabiby.com',
                                  textDirection: TextDirection.rtl,
                                  style: GoogleFonts.cairo(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18,
                                      color: HexColor.fromHex(
                                          Constants.app_color_on_secondary),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
