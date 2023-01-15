import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movieapp/core/models/doctor/doctor.dart';
import 'package:movieapp/core/models/specialization/specialization.dart';
import 'package:stacked/stacked.dart';

import '../../../core/models/clinic/clinic.dart';
import '../../../core/repositories/clinics_repository/clinics_repository.dart';
import '../../../core/repositories/doctors_repository/doctors_repository.dart';
import '../../../core/repositories/specializations_repository/specializations_repository.dart';
import '../../../locator.dart';

class ClinicsListViewModel extends BaseViewModel {
  BuildContext? context;

  List<Clinic> clinics_list = [];

  String? q = '';
  Clinic? selected_clinic;
  Future<void> init(BuildContext context) async {
    this.context = context;

    setBusy(true);

    clinics_list = await locator<ClinicsRepository>()
        .fetchClinicsList({'paginate': '100'});

    if (clinics_list.isNotEmpty) {
      selected_clinic = clinics_list.first;
    }
    setBusy(false);
  }
}
