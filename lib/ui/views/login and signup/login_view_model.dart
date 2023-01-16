import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '/core/services/navigation/navigation_service.dart';
import '/locator.dart';
import '/ui/router.gr.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends BaseViewModel {
  BuildContext? context;
  String? isLoggedIn;
  String? isRegistered;
  String? email;

  Future<void> login(String email, String password) async {
    setBusy(true);
    final url = Uri.parse('http://44.212.230.27:8000/api/v1/web-login');
    final response = await post(
      url,
      body: {'email': email, 'password': password},
    );
    var jsonResponse = jsonDecode(response.body);
    print(jsonResponse['message']);
    isLoggedIn = jsonResponse['message'];
    print(jsonResponse);

//-----SAVING THE TOKEN----------//
    if (isLoggedIn == "logged in") {
      var prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', jsonResponse['token']);
    }
    setBusy(false);
//-------------------------------//

    return jsonResponse['message'];
  }

  Future<void> signup(
      String email, String password, String phone, String name) async {
    final url = Uri.parse('http://44.212.230.27:8000/api/v1/register');
    final response = await post(
      url,
      body: {
        'email': email,
        'password': password,
        'name': name,
        'phone': phone
      },
    );

    var jsonResponse = jsonDecode(response.body);
    print(jsonResponse['message']);
    isRegistered = jsonResponse['message'];

    return jsonResponse['message'];
  }

  Future<String?>? getToken() async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    return token;
  }

  Future<void> getUser() async {
    setBusy(true);
    final url = Uri.parse('http://44.212.230.27:8000/api/v1/me');

    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    final response = await get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    var jsonResponse = jsonDecode(response.body);
    print(jsonResponse['email']);

    await prefs.setString('email', jsonResponse['email']);
    setBusy(false);
  }

  Future<void> loadHome() async {
    // ignore: unawaited_futures
    locator<NavigationService>().popAllAndPushNamed(HomePageRoute(), context!);
  }

  Future<void> clear() async {
    var preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
