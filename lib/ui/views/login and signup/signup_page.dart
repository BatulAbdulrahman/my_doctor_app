import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/ui/views/login%20and%20signup/login_page.dart';
import 'package:stacked/stacked.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/constants.dart';
import '../main/main_view.dart';
import 'login_view_model.dart';

class SignupPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) => Scaffold(
              body: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFcfdfda),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
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
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              height: 50,
                              margin: EdgeInsets.only(left: 40, right: 40),
                              child: TextFormField(
                                controller: nameController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Required";
                                  }
                                },
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "الاسم",
                                  hintStyle: GoogleFonts.cairo(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 10,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                  filled: true,
                                  //fillColor: Color(0xff161d27).withOpacity(0.9),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: HexColor.fromHex(Constants
                                              .app_color_on_secondary))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: HexColor.fromHex(Constants
                                              .app_color_on_secondary))),
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
                                controller: emailController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Required";
                                  }
                                },
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "البريد الالكتروني ",
                                  hintStyle: GoogleFonts.cairo(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 10,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                  filled: true,
                                  //fillColor: Color(0xff161d27).withOpacity(0.9),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: HexColor.fromHex(Constants
                                              .app_color_on_secondary))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: HexColor.fromHex(Constants
                                              .app_color_on_secondary))),
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
                                controller: phoneController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Required";
                                  }
                                },
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "رقم الهاتف",
                                  hintStyle: GoogleFonts.cairo(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 10,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                  filled: true,
                                  //fillColor: Color(0xff161d27).withOpacity(0.9),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: HexColor.fromHex(Constants
                                              .app_color_on_secondary))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: HexColor.fromHex(Constants
                                              .app_color_on_secondary))),
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
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "كلمة السر",
                                  hintStyle: GoogleFonts.cairo(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 10,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                  filled: true,
                                  //  fillColor: Color(0xff161d27).withOpacity(0.9),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: HexColor.fromHex(Constants
                                              .app_color_on_secondary))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: HexColor.fromHex(Constants
                                              .app_color_on_secondary))),
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
                                    await model.signup(
                                        emailController.text,
                                        passwordController.text,
                                        phoneController.text,
                                        nameController.text);

                                    if (model.isRegistered == 'logged in') {
                                      await model.getUser();
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CustomerMainView()),
                                      );
                                    } else {
                                      await Fluttertoast.showToast(
                                          msg: '${model.isRegistered}',
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
                                  "تسحيل",
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
                                  "هل لديك حساب بالفعل ؟",
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
                                          builder: (context) => LoginPage()),
                                    );
                                  }),
                                  child: Text(
                                    "تسحيل الدخول",
                                    style: GoogleFonts.cairo(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: HexColor.fromHex(
                                            Constants.app_color_secondary),
                                        fontWeight: FontWeight.bold),
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
                  ),
                ],
              ),
            ));
  }
}
