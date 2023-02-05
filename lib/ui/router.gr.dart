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
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../core/models/clinic/clinic.dart' as _i14;
import '../core/models/doctor/doctor.dart' as _i13;
import '../core/models/specialization/specialization.dart' as _i15;
import 'views/clinic_view/clinic_view.dart' as _i7;
import 'views/clinics_list/clinics_list_view.dart' as _i6;
import 'views/doctor_view/doctor_view.dart' as _i5;
import 'views/doctors_list/doctors_list_view.dart' as _i4;
import 'views/home_page/home_page.dart' as _i3;
import 'views/login%20and%20signup/login_page.dart' as _i10;
import 'views/onboarding_view/onboarding_view.dart' as _i2;
import 'views/spec_view/spec_view.dart' as _i9;
import 'views/specs_list/specs_list_view.dart' as _i8;
import 'views/startup/start_up_view.dart' as _i1;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    StartUpViewRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.StartUpView());
    },
    OnboardingViewRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.OnboardingView());
    },
    HomePageRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.HomePage());
    },
    DoctorsListViewRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.DoctorsListView());
    },
    DoctorViewRoute.name: (routeData) {
      final args = routeData.argsAs<DoctorViewRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.DoctorView(args.doctor));
    },
    ClinicsListViewRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.ClinicsListView());
    },
    ClinicViewRoute.name: (routeData) {
      final args = routeData.argsAs<ClinicViewRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.ClinicView(args.clinic));
    },
    SpecsListViewRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.SpecsListView());
    },
    SpecViewRoute.name: (routeData) {
      final args = routeData.argsAs<SpecViewRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i9.SpecView(args.specialization));
    },
    LoginPageRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i10.LoginPage());
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(StartUpViewRoute.name, path: '/'),
        _i11.RouteConfig(OnboardingViewRoute.name, path: '/onboarding-view'),
        _i11.RouteConfig(HomePageRoute.name, path: '/home-page'),
        _i11.RouteConfig(DoctorsListViewRoute.name, path: '/doctors-list-view'),
        _i11.RouteConfig(DoctorViewRoute.name, path: '/doctor-view'),
        _i11.RouteConfig(ClinicsListViewRoute.name, path: '/clinics-list-view'),
        _i11.RouteConfig(ClinicViewRoute.name, path: '/clinic-view'),
        _i11.RouteConfig(SpecsListViewRoute.name, path: '/specs-list-view'),
        _i11.RouteConfig(SpecViewRoute.name, path: '/spec-view'),
        _i11.RouteConfig(LoginPageRoute.name, path: '/login-page')
      ];
}

/// generated route for
/// [_i1.StartUpView]
class StartUpViewRoute extends _i11.PageRouteInfo<void> {
  const StartUpViewRoute() : super(StartUpViewRoute.name, path: '/');

  static const String name = 'StartUpViewRoute';
}

/// generated route for
/// [_i2.OnboardingView]
class OnboardingViewRoute extends _i11.PageRouteInfo<void> {
  const OnboardingViewRoute()
      : super(OnboardingViewRoute.name, path: '/onboarding-view');

  static const String name = 'OnboardingViewRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomePageRoute extends _i11.PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '/home-page');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i4.DoctorsListView]
class DoctorsListViewRoute extends _i11.PageRouteInfo<void> {
  const DoctorsListViewRoute()
      : super(DoctorsListViewRoute.name, path: '/doctors-list-view');

  static const String name = 'DoctorsListViewRoute';
}

/// generated route for
/// [_i5.DoctorView]
class DoctorViewRoute extends _i11.PageRouteInfo<DoctorViewRouteArgs> {
  DoctorViewRoute({required _i13.Doctor doctor})
      : super(DoctorViewRoute.name,
            path: '/doctor-view', args: DoctorViewRouteArgs(doctor: doctor));

  static const String name = 'DoctorViewRoute';
}

class DoctorViewRouteArgs {
  const DoctorViewRouteArgs({required this.doctor});

  final _i13.Doctor doctor;

  @override
  String toString() {
    return 'DoctorViewRouteArgs{doctor: $doctor}';
  }
}

/// generated route for
/// [_i6.ClinicsListView]
class ClinicsListViewRoute extends _i11.PageRouteInfo<void> {
  const ClinicsListViewRoute()
      : super(ClinicsListViewRoute.name, path: '/clinics-list-view');

  static const String name = 'ClinicsListViewRoute';
}

/// generated route for
/// [_i7.ClinicView]
class ClinicViewRoute extends _i11.PageRouteInfo<ClinicViewRouteArgs> {
  ClinicViewRoute({required _i14.Clinic clinic})
      : super(ClinicViewRoute.name,
            path: '/clinic-view', args: ClinicViewRouteArgs(clinic: clinic));

  static const String name = 'ClinicViewRoute';
}

class ClinicViewRouteArgs {
  const ClinicViewRouteArgs({required this.clinic});

  final _i14.Clinic clinic;

  @override
  String toString() {
    return 'ClinicViewRouteArgs{clinic: $clinic}';
  }
}

/// generated route for
/// [_i8.SpecsListView]
class SpecsListViewRoute extends _i11.PageRouteInfo<void> {
  const SpecsListViewRoute()
      : super(SpecsListViewRoute.name, path: '/specs-list-view');

  static const String name = 'SpecsListViewRoute';
}

/// generated route for
/// [_i9.SpecView]
class SpecViewRoute extends _i11.PageRouteInfo<SpecViewRouteArgs> {
  SpecViewRoute({required _i15.Specialization specialization})
      : super(SpecViewRoute.name,
            path: '/spec-view',
            args: SpecViewRouteArgs(specialization: specialization));

  static const String name = 'SpecViewRoute';
}

class SpecViewRouteArgs {
  const SpecViewRouteArgs({required this.specialization});

  final _i15.Specialization specialization;

  @override
  String toString() {
    return 'SpecViewRouteArgs{specialization: $specialization}';
  }
}

/// generated route for
/// [_i10.LoginPage]
class LoginPageRoute extends _i11.PageRouteInfo<void> {
  const LoginPageRoute() : super(LoginPageRoute.name, path: '/login-page');

  static const String name = 'LoginPageRoute';
}
