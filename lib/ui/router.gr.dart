// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../core/models/clinic/clinic.dart' as _i11;
import '../core/models/doctor/doctor.dart' as _i10;
import 'views/clinic_view/clinic_view.dart' as _i6;
import 'views/clinics_list/clinics_list_view.dart' as _i5;
import 'views/doctor_view/doctor_view.dart' as _i4;
import 'views/doctors_list/doctors_list_view.dart' as _i3;
import 'views/home_page/home_page.dart' as _i2;
import 'views/login%20and%20signup/login_page.dart' as _i7;
import 'views/startup/start_up_view.dart' as _i1;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    StartUpViewRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.StartUpView());
    },
    HomePageRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.HomePage());
    },
    DoctorsListViewRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.DoctorsListView());
    },
    DoctorViewRoute.name: (routeData) {
      final args = routeData.argsAs<DoctorViewRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.DoctorView(args.doctor));
    },
    ClinicsListViewRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.ClinicsListView());
    },
    ClinicViewRoute.name: (routeData) {
      final args = routeData.argsAs<ClinicViewRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.ClinicView(args.clinic));
    },
    LoginPageRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.LoginPage());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(StartUpViewRoute.name, path: '/'),
        _i8.RouteConfig(HomePageRoute.name, path: '/home-page'),
        _i8.RouteConfig(DoctorsListViewRoute.name, path: '/doctors-list-view'),
        _i8.RouteConfig(DoctorViewRoute.name, path: '/doctor-view'),
        _i8.RouteConfig(ClinicsListViewRoute.name, path: '/clinics-list-view'),
        _i8.RouteConfig(ClinicViewRoute.name, path: '/clinic-view'),
        _i8.RouteConfig(LoginPageRoute.name, path: '/login-page')
      ];
}

/// generated route for
/// [_i1.StartUpView]
class StartUpViewRoute extends _i8.PageRouteInfo<void> {
  const StartUpViewRoute() : super(StartUpViewRoute.name, path: '/');

  static const String name = 'StartUpViewRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomePageRoute extends _i8.PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '/home-page');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i3.DoctorsListView]
class DoctorsListViewRoute extends _i8.PageRouteInfo<void> {
  const DoctorsListViewRoute()
      : super(DoctorsListViewRoute.name, path: '/doctors-list-view');

  static const String name = 'DoctorsListViewRoute';
}

/// generated route for
/// [_i4.DoctorView]
class DoctorViewRoute extends _i8.PageRouteInfo<DoctorViewRouteArgs> {
  DoctorViewRoute({required _i10.Doctor doctor})
      : super(DoctorViewRoute.name,
            path: '/doctor-view', args: DoctorViewRouteArgs(doctor: doctor));

  static const String name = 'DoctorViewRoute';
}

class DoctorViewRouteArgs {
  const DoctorViewRouteArgs({required this.doctor});

  final _i10.Doctor doctor;

  @override
  String toString() {
    return 'DoctorViewRouteArgs{doctor: $doctor}';
  }
}

/// generated route for
/// [_i5.ClinicsListView]
class ClinicsListViewRoute extends _i8.PageRouteInfo<void> {
  const ClinicsListViewRoute()
      : super(ClinicsListViewRoute.name, path: '/clinics-list-view');

  static const String name = 'ClinicsListViewRoute';
}

/// generated route for
/// [_i6.ClinicView]
class ClinicViewRoute extends _i8.PageRouteInfo<ClinicViewRouteArgs> {
  ClinicViewRoute({required _i11.Clinic clinic})
      : super(ClinicViewRoute.name,
            path: '/clinic-view', args: ClinicViewRouteArgs(clinic: clinic));

  static const String name = 'ClinicViewRoute';
}

class ClinicViewRouteArgs {
  const ClinicViewRouteArgs({required this.clinic});

  final _i11.Clinic clinic;

  @override
  String toString() {
    return 'ClinicViewRouteArgs{clinic: $clinic}';
  }
}

/// generated route for
/// [_i7.LoginPage]
class LoginPageRoute extends _i8.PageRouteInfo<void> {
  const LoginPageRoute() : super(LoginPageRoute.name, path: '/login-page');

  static const String name = 'LoginPageRoute';
}
