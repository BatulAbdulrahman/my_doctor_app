import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movieapp/core/models/doctor/doctor.dart';
import 'package:movieapp/core/models/specialization/specialization.dart';
import 'package:stacked/stacked.dart';

import '../../../core/repositories/doctors_repository/doctors_repository.dart';
import '../../../core/repositories/specializations_repository/specializations_repository.dart';
import '../../../locator.dart';

class DoctorsListViewModel extends BaseViewModel {
  BuildContext? context;

  List<Doctor> doctors_list = [];
  List<Specialization> spec_list = [];

  String? q = '';
  Specialization? selected_spec;
  Doctor? selected_doctor;
  Future<void> init(BuildContext context) async {
    this.context = context;

    setBusy(true);

    doctors_list = await locator<DoctorsRepository>()
        .fetchDoctorsList({'paginate': '100'});

    spec_list =
        await locator<SpecializationsRepository>().fetchSpecializationsList();

    if (spec_list.isNotEmpty) {
      selected_spec = spec_list.first;
    }
    if (doctors_list.isNotEmpty) {
      selected_doctor = doctors_list.first;
    }

    setBusy(false);
  }
}
