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

class SpecsListViewModel extends BaseViewModel {
  BuildContext? context;

  List<Specialization> spec_list = [];

  String? q = '';
  Specialization? selected_spec;
  Future<void> init(BuildContext context) async {
    this.context = context;

    setBusy(true);

    spec_list = await locator<SpecializationsRepository>()
        .fetchSpecializationsList({'paginate': '100'});

    if (spec_list.isNotEmpty) {
      selected_spec = spec_list.first;
    }
    setBusy(false);
  }
}
