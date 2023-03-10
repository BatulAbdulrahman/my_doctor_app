import 'package:flutter/cupertino.dart';
import 'package:movieapp/core/models/doctor/doctor.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/services/navigation/navigation_service.dart';
import '../../../../locator.dart';
import '../../../router.gr.dart';

class DoctorTileViewModel extends BaseViewModel {
  Doctor? doctor;

  void init(Doctor doctor) {
    this.doctor = doctor;
    print(doctor.Specializations!.first.name!);
  }

  Future<void> moveToDoctorViewRoute(BuildContext context) async {
    await locator<NavigationService>()
        .pushNamed(DoctorViewRoute(doctor: doctor!), context);
  }
}
