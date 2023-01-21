import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '/core/services/key_storage/key_storage_service.dart';
import '/locator.dart';

class OnboardingViewModel extends BaseViewModel {
  final KeyStorageService? keyStorageService = locator<KeyStorageService>();

  BuildContext? context;

  Future<void> init(BuildContext context) async {
    setBusy(true);

    setBusy(false);
  }
}
