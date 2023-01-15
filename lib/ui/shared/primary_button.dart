import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constant/app_colors.dart';
import '../../core/constant/constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.buttonText,
    required this.press,
  }) : super(key: key);

  final VoidCallback press;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: 7.0 * 1.5,
            vertical: 7.0,
          ),
          backgroundColor: HexColor.fromHex(Constants.app_color_secondary)),
      onPressed: press,
      // icon: Icon(Icons.add_outlined),
      child: Text(
        buttonText,
        style: GoogleFonts.cairo(
            fontStyle: FontStyle.normal,
            fontSize: 15,
            color: HexColor.fromHex(Constants.app_color_on_primary),
            fontWeight: FontWeight.normal),
      ),
    );
  }
}
