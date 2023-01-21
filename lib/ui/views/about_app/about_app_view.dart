import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/ui/views/home_page/home_page.dart';
import 'package:movieapp/ui/widgets/stateless/drawer/custom_drawer.dart';
import 'package:stacked/stacked.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/constants.dart';
import '../contact_us/contact_us_view_model.dart';
import 'about_app_view_model.dart';

class AdoutAppView extends StatefulWidget {
  AdoutAppView();

  @override
  _AdoutAppViewState createState() => _AdoutAppViewState();
}

class _AdoutAppViewState extends State<AdoutAppView> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  List<Widget> _buildPageIndicator() {
    var list = <Widget>[];
    for (var i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive
            ? HexColor.fromHex(Constants.app_color_secondary)
            : HexColor.fromHex(Constants.app_color_on_primary),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdoutAppViewModel>.reactive(
        viewModelBuilder: () => AdoutAppViewModel(),
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
                'عن التطبيق',
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
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 400.0,
                          width: 350.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                HexColor.fromHex(Constants.app_color_primary),
                                HexColor.fromHex(
                                    Constants.app_color_primary_variant),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3.0,
                                color: Colors.grey,
                              )
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Container(
                                  height: 250.0,
                                  child: PageView(
                                    physics: ClampingScrollPhysics(),
                                    controller: _pageController,
                                    onPageChanged: (int page) {
                                      setState(() {
                                        _currentPage = page;
                                      });
                                    },
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Center(
                                                  child: Text(
                                                    'بحث عن طبيب',
                                                    style: GoogleFonts.cairo(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 26.0,
                                                      height: 1.5,
                                                      color: HexColor.fromHex(
                                                          Constants
                                                              .app_color_on_primary),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 20.0),
                                            Text(
                                              'تطبيق طبيبي يمكنك من البحث على اسم طبيب ترغب بزيارته، ومعرفة جدول مواعيده، ومكان تواجده، بالإضافة إلى إمكانية تقييمه في التطبيق بعد زيارته ليتمكن المستخدمين الآخرين من معرفة الآراء به.',
                                              textAlign: TextAlign.center,
                                              textDirection: TextDirection.rtl,
                                              style: GoogleFonts.cairo(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 18.0,
                                                height: 1.5,
                                                color: HexColor.fromHex(
                                                    Constants
                                                        .app_color_on_primary),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'بحث عن مصحة',
                                                    style: GoogleFonts.cairo(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 26.0,
                                                      height: 1.5,
                                                      color: HexColor.fromHex(
                                                          Constants
                                                              .app_color_on_primary),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 20.0),
                                            Text(
                                              'يمكنك البحث عن مصحة معينة لمعرفة موقعها، والأطباء الذين يعملون بها، وجداول أعمالهم',
                                              textAlign: TextAlign.center,
                                              textDirection: TextDirection.rtl,
                                              style: GoogleFonts.cairo(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 18.0,
                                                height: 1.5,
                                                color: HexColor.fromHex(
                                                    Constants
                                                        .app_color_on_primary),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Center(
                                                  child: Text(
                                                    'بحث عن تخصص',
                                                    style: GoogleFonts.cairo(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 26.0,
                                                      height: 1.5,
                                                      color: HexColor.fromHex(
                                                          Constants
                                                              .app_color_on_primary),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 20.0),
                                            Text(
                                              'إذا كنت ترغب في معرفة الأطباء في تخصص معين، يمكنك البحث عن التخصص لعرض قا الأطباء المختصين به وتقييماتهم.',
                                              textAlign: TextAlign.center,
                                              textDirection: TextDirection.rtl,
                                              style: GoogleFonts.cairo(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 18.0,
                                                height: 1.5,
                                                color: HexColor.fromHex(
                                                    Constants
                                                        .app_color_on_primary),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: _buildPageIndicator(),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: FractionalOffset.bottomRight,
                                        child: TextButton(
                                          onPressed: () {
                                            _pageController.previousPage(
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.ease,
                                            );
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              SizedBox(width: 10.0),
                                              Icon(
                                                Icons.arrow_back_ios,
                                                color: HexColor.fromHex(
                                                    Constants
                                                        .app_color_on_primary),
                                                size: 25.0,
                                              ),
                                              SizedBox(width: 5.0),
                                              Text(
                                                'السابق',
                                                style: GoogleFonts.cairo(
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 18,
                                                    color: HexColor.fromHex(
                                                        Constants
                                                            .app_color_on_primary),
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: FractionalOffset.bottomLeft,
                                        child: TextButton(
                                          onPressed: () {
                                            _pageController.nextPage(
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.ease,
                                            );
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text(
                                                'التالي',
                                                style: GoogleFonts.cairo(
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 18,
                                                    color: HexColor.fromHex(
                                                        Constants
                                                            .app_color_on_primary),
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              SizedBox(width: 5.0),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                color: HexColor.fromHex(
                                                    Constants
                                                        .app_color_on_primary),
                                                size: 25.0,
                                              ),
                                              SizedBox(width: 10.0),
                                            ],
                                          ),
                                        ),
                                      ),
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
            )));
  }
}
