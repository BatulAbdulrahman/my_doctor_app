import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movieapp/core/models/doctor/doctor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import 'package:http/http.dart';
import '../../../core/models/clinic/clinic.dart';
import '../../../core/repositories/clinics_repository/clinics_repository.dart';
import '../../../core/repositories/doctors_repository/doctors_repository.dart';
import '../../../locator.dart';

class DoctorViewModel extends BaseViewModel {
  BuildContext? context;
  Doctor? doctor;
  int rating = 0;
  List<Clinic> clinic = [];
  Future<void> init(BuildContext context, Doctor doctor) async {
    this.context = context;

    setBusy(true);

    this.doctor = await locator<DoctorsRepository>()
        .fetchDoctor({'id': doctor.id.toString()});

    clinic = await locator<ClinicsRepository>().fetchClinicsList();
    setBusy(false);
  }

  /*Future<String?>? getToken() async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    return token;
  }*/

  /*Future<void> getUser() async {
    setBusy(true);
    final url = Uri.parse('http://smdb.sadeem-lab.com/api/v1/movies/review');

    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    final response = await post(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    try {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse['email']);
    } catch (e, _) {
      debugPrint(e.toString());
    }
  }*/

  /*Future<void> sendReview(String comment, int rate) async {
    setBusy(true);
    print('the id is ${movie?.id}');
    print('the commet is ${comment}');
    print('the rate is $rate');
    final url = Uri.parse(
        'http://smdb.sadeem-lab.com/api/v1/movies/${movie!.id}/review');

    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    final response = await post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'rate': rate,
        'comment': comment,
      }),
    );
    try {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
    } catch (e, _) {
      debugPrint(e.toString());
    }
  }*/
}
