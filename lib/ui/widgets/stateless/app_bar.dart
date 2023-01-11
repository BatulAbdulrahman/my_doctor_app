import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_logo.dart';

// ignore: must_be_immutable
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {


  MyAppBar();

  @override
  Widget build(BuildContext context) {

    return AppBar(
      title: Container(
        height: 50.0,
        width: 50.0,
        margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: AppLogo(
          height: 50.0,
          width: 50.0,
        ),
      ),
      centerTitle: false,

    );
  }

  @override
  Size get preferredSize => Size.fromHeight((58));
}
