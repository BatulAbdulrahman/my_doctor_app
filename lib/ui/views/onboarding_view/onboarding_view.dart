import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/ui/views/login%20and%20signup/login_page.dart';
import 'package:stacked/stacked.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/constants.dart';
import 'onboarding_view_model.dart';

class OnboardingView extends StatefulWidget {
  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
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
    return ViewModelBuilder<OnboardingViewModel>.reactive(
        viewModelBuilder: () => OnboardingViewModel(),
        onModelReady: (model) async {
          await model.init(context);
        },
        builder: (context, model, child) => Scaffold(
              body: Container(
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
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerRight,
                        child: _currentPage != _numPages - 1
                            ? TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()),
                                  );
                                },
                                child: Text(
                                  '????????',
                                  style: GoogleFonts.cairo(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18,
                                      color: HexColor.fromHex(
                                          Constants.app_color_on_primary),
                                      fontWeight: FontWeight.normal),
                                ),
                              )
                            : Text(''),
                      ),
                      Container(
                        height: 500.0,
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
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Center(
                                    child: Image(
                                      image: AssetImage(
                                        'assets/images/slide_1.png',
                                      ),
                                      height: 250.0,
                                      width: 300.0,
                                    ),
                                  ),
                                  SizedBox(height: 20.0),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          '?????? ???? ????????',
                                          style: GoogleFonts.cairo(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 26.0,
                                            height: 1.5,
                                            color: HexColor.fromHex(
                                                Constants.app_color_on_primary),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.0),
                                  Text(
                                    '?????????? ?????????? ?????????? ???? ?????????? ?????? ?????? ???????? ???????? ???????????????? ???????????? ???????? ???????????????? ?????????? ?????????????? ???????????????? ?????? ?????????????? ???????????? ???? ?????????????? ?????? ???????????? ???????????? ???????????????????? ?????????????? ???? ?????????? ???????????? ????.',
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.rtl,
                                    style: GoogleFonts.cairo(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18.0,
                                      height: 1.5,
                                      color: HexColor.fromHex(
                                          Constants.app_color_on_primary),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Center(
                                    child: Image(
                                      image: AssetImage(
                                        'assets/images/slide_2.png',
                                      ),
                                      height: 250.0,
                                      width: 300.0,
                                    ),
                                  ),
                                  SizedBox(height: 20.0),
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '?????? ???? ????????',
                                          style: GoogleFonts.cairo(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 26.0,
                                            height: 1.5,
                                            color: HexColor.fromHex(
                                                Constants.app_color_on_primary),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20.0),
                                  Text(
                                    '?????????? ?????????? ???? ???????? ?????????? ???????????? ?????????????? ???????????????? ?????????? ???????????? ???????? ???????????? ??????????????',
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.rtl,
                                    style: GoogleFonts.cairo(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18.0,
                                      height: 1.5,
                                      color: HexColor.fromHex(
                                          Constants.app_color_on_primary),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Center(
                                    child: Image(
                                      image: AssetImage(
                                        'assets/images/slide_3.png',
                                      ),
                                      height: 250.0,
                                      width: 300.0,
                                    ),
                                  ),
                                  SizedBox(height: 20.0),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          '?????? ???? ????????',
                                          style: GoogleFonts.cairo(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 26.0,
                                            height: 1.5,
                                            color: HexColor.fromHex(
                                                Constants.app_color_on_primary),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.0),
                                  Text(
                                    '?????? ?????? ???????? ???? ?????????? ?????????????? ???? ???????? ?????????? ?????????? ?????????? ???? ???????????? ???????? ???? ?????????????? ???????????????? ???? ????????????????????.',
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.rtl,
                                    style: GoogleFonts.cairo(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18.0,
                                      height: 1.5,
                                      color: HexColor.fromHex(
                                          Constants.app_color_on_primary),
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
                      _currentPage != _numPages - 1
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: FractionalOffset.bottomRight,
                                    child: TextButton(
                                      onPressed: () {
                                        _pageController.previousPage(
                                          duration: Duration(milliseconds: 500),
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
                                                Constants.app_color_on_primary),
                                            size: 25.0,
                                          ),
                                          SizedBox(width: 5.0),
                                          Text(
                                            '????????????',
                                            style: GoogleFonts.cairo(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 18,
                                                color: HexColor.fromHex(
                                                    Constants
                                                        .app_color_on_primary),
                                                fontWeight: FontWeight.normal),
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
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Text(
                                            '????????????',
                                            style: GoogleFonts.cairo(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 18,
                                                color: HexColor.fromHex(
                                                    Constants
                                                        .app_color_on_primary),
                                                fontWeight: FontWeight.normal),
                                          ),
                                          SizedBox(width: 5.0),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: HexColor.fromHex(
                                                Constants.app_color_on_primary),
                                            size: 25.0,
                                          ),
                                          SizedBox(width: 10.0),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Text(''),
                    ],
                  ),
                ),
              ),
              bottomSheet: _currentPage == _numPages - 1
                  ? Container(
                      height: 80.0,
                      width: double.infinity,
                      color: Colors.white,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: Center(
                          child: Text(
                            '??????????',
                            style: GoogleFonts.cairo(
                                fontStyle: FontStyle.normal,
                                fontSize: 20,
                                color: HexColor.fromHex(
                                    Constants.app_color_secondary),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  : Text(''),
            ));
  }
}
