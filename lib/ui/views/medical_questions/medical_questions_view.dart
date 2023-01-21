import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/ui/views/home_page/home_page.dart';
import 'package:movieapp/ui/widgets/stateless/drawer/custom_drawer.dart';
import 'package:stacked/stacked.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/constants.dart';
import 'medical_questions_view_model.dart';

class MedicalQuestionView extends StatefulWidget {
  MedicalQuestionView();

  @override
  _MedicalQuestionViewState createState() => _MedicalQuestionViewState();
}

class _MedicalQuestionViewState extends State<MedicalQuestionView>
    with SingleTickerProviderStateMixin {
  @override
  void didUpdateWidget(MedicalQuestionView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

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

    return ViewModelBuilder<MedicalQuestionViewModel>.reactive(
        viewModelBuilder: () => MedicalQuestionViewModel(),
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
                'الأسئـلة الطبيـة',
                style: GoogleFonts.cairo(
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    color: HexColor.fromHex(Constants.app_color_on_secondary),
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 200.0,
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
                                left: 18.0,
                                right: 18.0,
                                top: 10.0,
                                bottom: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'ماذا افعل لمنع تفاقم مرض السكري؟',
                                  style: GoogleFonts.cairo(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      color: HexColor.fromHex(
                                          Constants.app_color_on_secondary),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'تأكد من أن لديك: برنامج لممارسة الرياضة - حبوب يومية لتسكين الألم، إذا وافق طبيبك على ذلك - علاج ملائم ضد ارتفاع ضغط الدم وارتفاع الكولسترول في الدم - فحص سنوي للكشف عن البروتين في البول - فحص عينين سنوي من قبل طبيب العيون - برنامج يومي لعلاج اكف القدمين - عدم التدخين - اهتم أن يكون سجل اللقاحات الخاص بك محدث.',
                                  style: GoogleFonts.cairo(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12,
                                      color: HexColor.fromHex(
                                          Constants.app_color_on_secondary),
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 200.0,
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
                                      color: HexColor.fromHex(
                                          Constants.app_color_on_secondary),
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
                                      color: HexColor.fromHex(
                                          Constants.app_color_on_secondary),
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 200.0,
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
                                      color: HexColor.fromHex(
                                          Constants.app_color_on_secondary),
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
                                      color: HexColor.fromHex(
                                          Constants.app_color_on_secondary),
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 200.0,
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
                                left: 18.0,
                                right: 18.0,
                                top: 10.0,
                                bottom: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'ما هي اسباب تكون حب الشباب؟',
                                  style: GoogleFonts.cairo(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      color: HexColor.fromHex(
                                          Constants.app_color_on_secondary),
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
                                      color: HexColor.fromHex(
                                          Constants.app_color_on_secondary),
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}
