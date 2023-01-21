import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:movieapp/generated/l10n.dart';

import '../home_page/home_page.dart';
import '/ui/widgets/animation/fade_in.dart';
import 'main_view_model.dart';

class CustomerMainView extends StatefulWidget {
  @override
  _CustomerMainViewState createState() => _CustomerMainViewState();
}

class _CustomerMainViewState extends State<CustomerMainView> {
  final _views = [
    FadeIn(child: HomePage()),
  ];

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  // int _selectedIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

//
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomerMainViewModel>.reactive(
      onModelReady: (model) {
        model.init(context);
      },
      viewModelBuilder: () => CustomerMainViewModel(),
      builder: (context, model, child) => DefaultTabController(
        length: _views.length,
        child: Scaffold(),
      ),
    );
  }
}
