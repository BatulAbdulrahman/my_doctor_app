import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'customer_drawer_menu_view_model.dart';

class CustomerDrawerMenu extends StatelessWidget {
  const CustomerDrawerMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var blackColor = Colors.black.withOpacity(0.6);

    return ViewModelBuilder<CustomerDrawerMenuViewModel>.nonReactive(
      viewModelBuilder: () => CustomerDrawerMenuViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[],
        ),
      ),
    );
  }
}
