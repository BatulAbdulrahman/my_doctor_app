import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../core/services/http/http_service.dart';
import '../../../core/services/key_storage/key_storage_service.dart';
import '../../../locator.dart';

class HomePageModel extends BaseViewModel {
  BuildContext? context;

  Future<void> init(BuildContext context) async {
    this.context = context;

    setBusy(true);

    setBusy(false);
  }
}
