import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/ui/views/doctors_list/doctors_list_view.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/constants.dart';
import '../../shared/responsive.dart';
import '../../views/clinics_list/clinics_list_view.dart';
import '../../views/specs_list/specs_list_view.dart';
import 'analytic_cards_model.dart';

class AnalyticCards extends StatelessWidget {
  //const AnalyticCards({Key? key}) : super(key: key);
  final int crossAxisCount;
  final double childAspectRatio;

  const AnalyticCards({
    Key? key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 0.5,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ViewModelBuilder<AnalyticCardsModel>.nonReactive(
      viewModelBuilder: () => AnalyticCardsModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DoctorsListView()),
                );
              }),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0 / 2,
                  vertical: 16.0 / 2,
                ),
                decoration: BoxDecoration(
                  color: HexColor.fromHex(Constants.app_color_on_primary),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: HexColor.fromHex(Constants.app_color_secondary)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.0 / 2),
                      height: 60,
                      width: 75,
                      decoration: BoxDecoration(
                          color:
                              HexColor.fromHex(Constants.app_color_on_secondary)
                                  .withOpacity(0.1),
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.people,
                        color: HexColor.fromHex(Constants.app_color_secondary),
                      ),
                    ),
                    Text(
                      "الأطباء",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.cairo(
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: HexColor.fromHex(
                              Constants.app_color_on_secondary),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 25,
            ),
            InkWell(
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SpecsListView()),
                );
              }),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0 / 2,
                  vertical: 16.0 / 2,
                ),
                decoration: BoxDecoration(
                  color: HexColor.fromHex(Constants.app_color_on_primary),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: HexColor.fromHex(Constants.app_color_secondary)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.0 / 2),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color:
                              HexColor.fromHex(Constants.app_color_on_secondary)
                                  .withOpacity(0.1),
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.list_alt_outlined,
                        color: HexColor.fromHex(Constants.app_color_secondary),
                      ),
                    ),
                    Text(
                      "التخصصات",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.cairo(
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: HexColor.fromHex(
                              Constants.app_color_on_secondary),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 25,
            ),
            InkWell(
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClinicsListView()),
                );
              }),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0 / 2,
                  vertical: 16.0 / 2,
                ),
                decoration: BoxDecoration(
                  color: HexColor.fromHex(Constants.app_color_on_primary),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: HexColor.fromHex(Constants.app_color_secondary)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.0 / 2),
                      height: 60,
                      width: 75,
                      decoration: BoxDecoration(
                          color:
                              HexColor.fromHex(Constants.app_color_on_secondary)
                                  .withOpacity(0.1),
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.business_outlined,
                        color: HexColor.fromHex(Constants.app_color_secondary),
                      ),
                    ),
                    Text(
                      "المصحات",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.cairo(
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: HexColor.fromHex(
                              Constants.app_color_on_secondary),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
