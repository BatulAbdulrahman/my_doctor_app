import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/ui/views/home_page/home_page_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:logging/logging.dart';

import '../../../core/constant/app_colors.dart';
import '../../shared/themes.dart';
import '../../widgets/analytic_cards/analytic_cards.dart';
import '../../widgets/stateless/drawer/custom_drawer.dart';
import '/ui/widgets/stateless/app_bar.dart';
import '../../widgets/stateless/indicators/loading_circular_progress_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/constants.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  final _log = Logger('HomePage');

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
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

    return ViewModelBuilder<HomePageModel>.reactive(
      viewModelBuilder: () => HomePageModel(),
      onModelReady: (model) async {
        await model.init(context);
      },
      builder: (context, model, child) => Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        drawer: Drawer(
          width: 300,
          elevation: 0,
          child: Expanded(child: CustomDrawer()),
        ),
        appBar: AppBar(
          //debugShowCheckedModeBanner: false,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          elevation: 0,

          leading: IconButton(
            color: AppColors.app_color_primary,
            icon: Icon(Icons.menu),
            onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          ),
          title: Center(
            child: Text(
              "الرئيسية",
              style: GoogleFonts.cairo(
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  color: HexColor.fromHex(Constants.app_color_on_secondary),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: model.isBusy
            ? LoadingCircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "الإعلانات",
                      style: GoogleFonts.cairo(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          color: HexColor.fromHex(
                              Constants.app_color_on_secondary),
                          fontWeight: FontWeight.bold),
                    ),
                    //image Slider in Top
                    Container(
                      child: CarouselSlider(
                          options: CarouselOptions(
                            height: 250,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                          ),
                          items: [
                            Container(
                              height: 450.0,
                              width: 650.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/images/photo_2023-01-15_13-22-30.jpg',
                                  ),
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                            Container(
                              height: 450.0,
                              width: 650.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/images/photo_2023-01-15_13-22-37.jpg',
                                  ),
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                            Container(
                              height: 450.0,
                              width: 650.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/images/photo_2023-01-15_13-22-30.jpg',
                                  ),
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "عما تبحث؟",
                      style: GoogleFonts.cairo(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          color: HexColor.fromHex(
                              Constants.app_color_on_secondary),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AnalyticCards(),
                  ],
                ),
              ),
      ),
    );
  }
}
