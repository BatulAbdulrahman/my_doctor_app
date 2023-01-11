import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '/core/services/key_storage/key_storage_service.dart';
import '/core/services/navigation/navigation_service.dart';
import '/locator.dart';
import '../../../router.gr.dart';

class CustomerDrawerMenuViewModel extends BaseViewModel {
  final KeyStorageService? keyStorageService = locator<KeyStorageService>();
  final NavigationService? _navigationService = locator<NavigationService>();

  Future<void> init() async {
    notifyListeners();
  }

  void moveToLogin(BuildContext context) {}

  void showCustomerMain(BuildContext context) {
    Navigator.of(context).pop();

  }
}
