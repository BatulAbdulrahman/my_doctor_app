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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../core/models/doctor/doctor.dart' as _i8;
import 'views/doctor_view/doctor_view.dart' as _i4;
import 'views/doctors_list/doctors_list_view.dart' as _i3;
import 'views/home_page/home_page.dart' as _i2;
import 'views/settings/settings_view.dart' as _i5;
import 'views/startup/start_up_view.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    StartUpViewRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.StartUpView());
    },
    HomePageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.HomePage());
    },
    DoctorsListViewRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.DoctorsListView());
    },
    DoctorViewRoute.name: (routeData) {
      final args = routeData.argsAs<DoctorViewRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.DoctorView(args.doctor));
    },
    SettingsViewRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.SettingsView());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(StartUpViewRoute.name, path: '/'),
        _i6.RouteConfig(HomePageRoute.name, path: '/home-page'),
        _i6.RouteConfig(DoctorsListViewRoute.name, path: '/doctors-list-view'),
        _i6.RouteConfig(DoctorViewRoute.name, path: '/doctor-view'),
        _i6.RouteConfig(SettingsViewRoute.name, path: '/settings-view')
      ];
}

/// generated route for
/// [_i1.StartUpView]
class StartUpViewRoute extends _i6.PageRouteInfo<void> {
  const StartUpViewRoute() : super(StartUpViewRoute.name, path: '/');

  static const String name = 'StartUpViewRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomePageRoute extends _i6.PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '/home-page');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i3.DoctorsListView]
class DoctorsListViewRoute extends _i6.PageRouteInfo<void> {
  const DoctorsListViewRoute()
      : super(DoctorsListViewRoute.name, path: '/doctors-list-view');

  static const String name = 'DoctorsListViewRoute';
}

/// generated route for
/// [_i4.DoctorView]
class DoctorViewRoute extends _i6.PageRouteInfo<DoctorViewRouteArgs> {
  DoctorViewRoute({required _i8.Doctor doctor})
      : super(DoctorViewRoute.name,
            path: '/doctor-view', args: DoctorViewRouteArgs(doctor: doctor));

  static const String name = 'DoctorViewRoute';
}

class DoctorViewRouteArgs {
  const DoctorViewRouteArgs({required this.doctor});

  final _i8.Doctor doctor;

  @override
  String toString() {
    return 'DoctorViewRouteArgs{doctor: $doctor}';
  }
}

/// generated route for
/// [_i5.SettingsView]
class SettingsViewRoute extends _i6.PageRouteInfo<void> {
  const SettingsViewRoute()
      : super(SettingsViewRoute.name, path: '/settings-view');

  static const String name = 'SettingsViewRoute';
}
