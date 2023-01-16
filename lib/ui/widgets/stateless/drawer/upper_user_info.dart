import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/ui/views/login%20and%20signup/login_page.dart';
import 'package:movieapp/ui/widgets/stateless/drawer/upper_userViewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/constants.dart';
import '/ui/views/startup/start_up_view_model.dart';
import '/ui/widgets/stateless/app_logo.dart';

class UpperUserInfo extends StatefulWidget {
  const UpperUserInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<UpperUserInfo> createState() => _UpperUserInfoState();
}

class _UpperUserInfoState extends State<UpperUserInfo> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UpperUserViewModel>.reactive(
        viewModelBuilder: () => UpperUserViewModel(),
        onModelReady: (model) async {
          await model.init(context);
        },
        builder: (context, model, child) => AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0),
            ),
            child: Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Expanded(
                      flex: 2,
                      child: IconButton(
                          alignment: Alignment.bottomLeft,
                          color: AppColors.app_color_primary,
                          icon: Icon(Icons.keyboard_arrow_right_outlined),
                          iconSize: 30,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          }),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'تسجيل الدخول',
                                  style: GoogleFonts.cairo(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15,
                                      color: HexColor.fromHex(
                                          Constants.app_color_on_secondary),
                                      fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
