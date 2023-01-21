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
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../core/models/clinic/clinic.dart' as _i12;
import '../core/models/doctor/doctor.dart' as _i11;
import 'views/clinic_view/clinic_view.dart' as _i7;
import 'views/clinics_list/clinics_list_view.dart' as _i6;
import 'views/doctor_view/doctor_view.dart' as _i5;
import 'views/doctors_list/doctors_list_view.dart' as _i4;
import 'views/home_page/home_page.dart' as _i3;
import 'views/login%20and%20signup/login_page.dart' as _i8;
import 'views/onboarding_view/onboarding_view.dart' as _i2;
import 'views/startup/start_up_view.dart' as _i1;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    StartUpViewRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.StartUpView());
    },
    OnboardingViewRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.OnboardingView());
    },
    HomePageRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.HomePage());
    },
    DoctorsListViewRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.DoctorsListView());
    },
    DoctorViewRoute.name: (routeData) {
      final args = routeData.argsAs<DoctorViewRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.DoctorView(args.doctor));
    },
    ClinicsListViewRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.ClinicsListView());
    },
    ClinicViewRoute.name: (routeData) {
      final args = routeData.argsAs<ClinicViewRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.ClinicView(args.clinic));
    },
    LoginPageRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.LoginPage());
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(StartUpViewRoute.name, path: '/'),
        _i9.RouteConfig(OnboardingViewRoute.name, path: '/onboarding-view'),
        _i9.RouteConfig(HomePageRoute.name, path: '/home-page'),
        _i9.RouteConfig(DoctorsListViewRoute.name, path: '/doctors-list-view'),
        _i9.RouteConfig(DoctorViewRoute.name, path: '/doctor-view'),
        _i9.RouteConfig(ClinicsListViewRoute.name, path: '/clinics-list-view'),
        _i9.RouteConfig(ClinicViewRoute.name, path: '/clinic-view'),
        _i9.RouteConfig(LoginPageRoute.name, path: '/login-page')
      ];
}

/// generated route for
/// [_i1.StartUpView]
class StartUpViewRoute extends _i9.PageRouteInfo<void> {
  const StartUpViewRoute() : super(StartUpViewRoute.name, path: '/');

  static const String name = 'StartUpViewRoute';
}

/// generated route for
/// [_i2.OnboardingView]
class OnboardingViewRoute extends _i9.PageRouteInfo<void> {
  const OnboardingViewRoute()
      : super(OnboardingViewRoute.name, path: '/onboarding-view');

  static const String name = 'OnboardingViewRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomePageRoute extends _i9.PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '/home-page');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i4.DoctorsListView]
class DoctorsListViewRoute extends _i9.PageRouteInfo<void> {
  const DoctorsListViewRoute()
      : super(DoctorsListViewRoute.name, path: '/doctors-list-view');

  static const String name = 'DoctorsListViewRoute';
}

/// generated route for
/// [_i5.DoctorView]
class DoctorViewRoute extends _i9.PageRouteInfo<DoctorViewRouteArgs> {
  DoctorViewRoute({required _i11.Doctor doctor})
      : super(DoctorViewRoute.name,
            path: '/doctor-view', args: DoctorViewRouteArgs(doctor: doctor));

  static const String name = 'DoctorViewRoute';
}

class DoctorViewRouteArgs {
  const DoctorViewRouteArgs({required this.doctor});

  final _i11.Doctor doctor;

  @override
  String toString() {
    return 'DoctorViewRouteArgs{doctor: $doctor}';
  }
}

/// generated route for
/// [_i6.ClinicsListView]
class ClinicsListViewRoute extends _i9.PageRouteInfo<void> {
  const ClinicsListViewRoute()
      : super(ClinicsListViewRoute.name, path: '/clinics-list-view');

  static const String name = 'ClinicsListViewRoute';
}

/// generated route for
/// [_i7.ClinicView]
class ClinicViewRoute extends _i9.PageRouteInfo<ClinicViewRouteArgs> {
  ClinicViewRoute({required _i12.Clinic clinic})
      : super(ClinicViewRoute.name,
            path: '/clinic-view', args: ClinicViewRouteArgs(clinic: clinic));

  static const String name = 'ClinicViewRoute';
}

class ClinicViewRouteArgs {
  const ClinicViewRouteArgs({required this.clinic});

  final _i12.Clinic clinic;

  @override
  String toString() {
    return 'ClinicViewRouteArgs{clinic: $clinic}';
  }
}

/// generated route for
/// [_i8.LoginPage]
class LoginPageRoute extends _i9.PageRouteInfo<void> {
  const LoginPageRoute() : super(LoginPageRoute.name, path: '/login-page');

  static const String name = 'LoginPageRoute';
}
