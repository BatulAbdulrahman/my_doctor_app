import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:logging/logging.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../core/constant/app_colors.dart';
import '../../shared/themes.dart';
import '../../widgets/stateless/drawer/custom_drawer.dart';
import '/ui/widgets/stateless/app_bar.dart';
import '../../widgets/stateless/indicators/loading_circular_progress_indicator.dart';
import 'home_page_view_model.dart';

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
            color: AppColors.app_color_on_primary,
            icon: Icon(Icons.menu),
            onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          ),
          title: Text("Hello!",
              style: TextStyle(
                color: Color(0xFF2E2F5B),
              )),
        ),
        body: model.isBusy
            ? LoadingCircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, top: 15, bottom: 10),
                        child: Text(
                          'Most Watched',
                          style: TextStyle(
                              color: Color(0xFF2E2F5B),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                    ),
                    //image Slider in Top
                    Container(
                      child: ListView(
                        children: <Widget>[
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 350.0,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              aspectRatio: 16 / 9,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              viewportFraction: 0.7,
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
                                      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
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
                                      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    /* Expanded(
                      child:
                        
                    ),*/
                  ],
                ),
              ),
      ),
    );
  }
}
