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
import '../medical_questions/medical_questions_view.dart';
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
        backgroundColor: Color(0xFFcfdfda),
        drawer: Drawer(
          width: 300,
          elevation: 0,
          child: Expanded(child: CustomDrawer()),
        ),
        appBar: AppBar(
          //debugShowCheckedModeBanner: false,
          backgroundColor: Color(0xFFcfdfda),
          elevation: 0,

          leading: IconButton(
            color: AppColors.app_color_primary,
            icon: Icon(Icons.menu),
            onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          ),

          centerTitle: true,
          title: Text(
            'الرئـيسـية',
            style: GoogleFonts.cairo(
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: HexColor.fromHex(Constants.app_color_on_secondary),
                fontWeight: FontWeight.bold),
          ),
        ),
        body: model.isBusy
            ? LoadingCircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'الإعـلانـات',
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
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      color: Colors.grey,
                                    )
                                  ],
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
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      color: Colors.grey,
                                    )
                                  ],
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
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'عمـا تبحـث؟',
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
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'الأسئـلة الطبيـة',
                            style: GoogleFonts.cairo(
                                fontStyle: FontStyle.normal,
                                fontSize: 20,
                                color: HexColor.fromHex(
                                    Constants.app_color_on_secondary),
                                fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MedicalQuestionView()),
                              );
                            },
                            child: Text(
                              'الكـل',
                              style: GoogleFonts.cairo(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  color: HexColor.fromHex(
                                      Constants.app_color_secondary),
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: CarouselSlider(
                            options: CarouselOptions(
                              height: 250,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                            ),
                            items: [
                              Expanded(
                                child: Container(
                                  height: 600.0,
                                  width: 650.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 5.0,
                                        color: Colors.grey,
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0,
                                        right: 18.0,
                                        top: 10.0,
                                        bottom: 10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'ماذا افعل لمنع تفاقم مرض السكري؟',
                                          style: GoogleFonts.cairo(
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14,
                                              color: HexColor.fromHex(Constants
                                                  .app_color_on_secondary),
                                              fontWeight: FontWeight.bold),
                                          textDirection: TextDirection.rtl,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'تأكد من أن لديك: برنامج لممارسة الرياضة - حبوب يومية لتسكين الألم، إذا وافق طبيبك على ذلك - علاج ملائم ضد ارتفاع ضغط الدم وارتفاع الكولسترول في الدم - فحص سنوي للكشف عن البروتين في البول - فحص عينين سنوي من قبل طبيب العيون - برنامج يومي لعلاج اكف القدمين - عدم التدخين - اهتم أن يكون سجل اللقاحات الخاص بك محدث.',
                                          style: GoogleFonts.cairo(
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12,
                                              color: HexColor.fromHex(Constants
                                                  .app_color_on_secondary),
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 450.0,
                                width: 650.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18.0,
                                      right: 18.0,
                                      top: 10.0,
                                      bottom: 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'ما هو ضغط الدم الطبيعي؟',
                                        style: GoogleFonts.cairo(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14,
                                            color: HexColor.fromHex(Constants
                                                .app_color_on_secondary),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'ضغط الدم "الطبيعي" هو عندما يكون الضغط الانقباضي الأقل من 120 والضغط الانبساطي الأقل من 80 ملليمتر من الزئبق (mm Hg).',
                                        style: GoogleFonts.cairo(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12,
                                            color: HexColor.fromHex(Constants
                                                .app_color_on_secondary),
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 600.0,
                                width: 650.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18.0,
                                      right: 18.0,
                                      top: 10.0,
                                      bottom: 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'ما هي العوامل التي تزيد احتمال الإصابة بآلام أسفل الظهر؟',
                                        style: GoogleFonts.cairo(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14,
                                            color: HexColor.fromHex(Constants
                                                .app_color_on_secondary),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '.بالغالب، تصيبنا آلام المنطقة السفلى من الظهر بسبب تزامن عدة عوامل مع بعضها البعض، مثل استخدام العضلات وشدّها بشكل مفرط، تضرر العضلات، أو تضرر الأربطة الداعمة للعمود الفقري. في بعض الحالات الأقل انتشارا، من الممكن أن نشعر بألم الظهر نتيجة للإصابة بالمرض أو بسبب التواء النخاع الشوكي.',
                                        style: GoogleFonts.cairo(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12,
                                            color: HexColor.fromHex(Constants
                                                .app_color_on_secondary),
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 450.0,
                                width: 650.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18.0,
                                      right: 18.0,
                                      top: 10.0,
                                      bottom: 10.0),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'ما هي اسباب تكون حب الشباب؟',
                                          style: GoogleFonts.cairo(
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14,
                                              color: HexColor.fromHex(Constants
                                                  .app_color_on_secondary),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'فرط إفراز الزيوت (الدهون) - انسداد جُريبات الشعر بالزيوت وخلايا الجلد الميتة - البكتيريا - التهاب.',
                                          style: GoogleFonts.cairo(
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12,
                                              color: HexColor.fromHex(Constants
                                                  .app_color_on_secondary),
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
