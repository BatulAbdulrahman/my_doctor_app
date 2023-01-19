import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/ui/views/main/main_view.dart';
import 'package:movieapp/ui/views/login%20and%20signup/signup_page.dart';
import 'package:stacked/stacked.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/constants.dart';
import '../../router.gr.dart';
import '../Home_page/home_page.dart';
import '../startup/start_up_view_model.dart';
import 'login_view_model.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        onModelReady: (model) async => await model.clear(),
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) => Scaffold(
              body: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(color: Color(0xFFFAFAFA)),
                  ),
                  InkWell(
                      onTap: (() {
                        model.clear();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      }),
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(25, 50, 30, 0),
                          child: Text(
                            "تخطي",
                            style: GoogleFonts.cairo(
                                fontStyle: FontStyle.normal,
                                fontSize: 15,
                                color: HexColor.fromHex(
                                    Constants.app_color_on_secondary),
                                fontWeight: FontWeight.bold),
                          ))),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 45),
                    child: Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 300.0,
                            width: 400.0,
                            decoration: BoxDecoration(
                              //borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage(
                                  'assets/images/طبيبي-removebg-preview.png',
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            height: 50,
                            margin: EdgeInsets.only(left: 40, right: 40),
                            child: TextFormField(
                              controller: emailController,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "خطأ , الرجاء ملئ حقل البريد الالكتروني";
                                }
                              },
                              style: GoogleFonts.cairo(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15,
                                  color: HexColor.fromHex(
                                      Constants.app_color_on_secondary),
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: "البريد الالكتروني ",
                                hintStyle: GoogleFonts.cairo(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 10,
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.bold),
                                filled: true,
                                //fillColor: Color(0xff161d27).withOpacity(0.9),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: HexColor.fromHex(
                                            Constants.app_color_on_secondary))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: HexColor.fromHex(
                                            Constants.app_color_on_secondary))),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            height: 50,
                            margin: EdgeInsets.only(left: 40, right: 40),
                            child: TextFormField(
                              controller: passwordController,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Required";
                                }
                                if (val.length < 6) {
                                  return "Password must be atleast 6 characters long";
                                }
                                if (val.length > 20) {
                                  return "Password must be less than 20 characters";
                                }
                                if (!val.contains(RegExp(r'[0-9]'))) {
                                  return "Password must contain a number";
                                }
                              },
                              obscureText: true,
                              style: GoogleFonts.cairo(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: "كلمة السر",
                                hintStyle: GoogleFonts.cairo(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 10,
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.bold),
                                filled: true,
                                //  fillColor: Color(0xff161d27).withOpacity(0.9),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: HexColor.fromHex(
                                            Constants.app_color_on_secondary))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: HexColor.fromHex(
                                            Constants.app_color_on_secondary))),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            margin: EdgeInsets.only(left: 40, right: 40),
                            child: ElevatedButton(
                              onPressed: () async {
                                try {
                                  await model.login(emailController.text,
                                      passwordController.text);

                                  if (model.isLoggedIn == 'logged in') {
                                    await model.getUser();
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()),
                                    );
                                  } else {
                                    await Fluttertoast.showToast(
                                        msg: 'user not found',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                } catch (e) {
                                  print(e);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: HexColor.fromHex(
                                    Constants.app_color_secondary),
                              ),
                              child: Text(
                                "تسجيل ",
                                style: GoogleFonts.cairo(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "ليس لديك حساب ؟",
                                style: GoogleFonts.cairo(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                    color: HexColor.fromHex(
                                        Constants.app_color_on_secondary),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              InkWell(
                                onTap: (() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignupPage()),
                                  );
                                }),
                                child: InkWell(
                                  onTap: null,
                                  child: Text(
                                    " تسجيل",
                                    style: GoogleFonts.cairo(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: HexColor.fromHex(
                                            Constants.app_color_secondary),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
