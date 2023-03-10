import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomePageModel extends BaseViewModel {
  BuildContext? context;

  Future<void> init(BuildContext context) async {
    this.context = context;

    setBusy(true);

    setBusy(false);
  }
}
