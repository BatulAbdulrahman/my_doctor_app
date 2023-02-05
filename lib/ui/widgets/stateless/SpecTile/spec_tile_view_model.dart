import 'package:flutter/cupertino.dart';
import 'package:movieapp/core/models/clinic/clinic.dart';
import 'package:movieapp/core/models/doctor/doctor.dart';
import 'package:movieapp/core/models/specialization/specialization.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/services/navigation/navigation_service.dart';
import '../../../../locator.dart';
import '../../../router.gr.dart';

class SpecTileViewModel extends BaseViewModel {
  Specialization? specialization;

  void init(Specialization specialization) {
    this.specialization = specialization;
    // print(doctor.Specializations!.first.name!);
  }

  Future<void> moveToSpecsViewRoute(BuildContext context) async {
    await locator<NavigationService>()
        .pushNamed(SpecViewRoute(specialization: specialization!), context);
  }
}
