import 'package:auto_route/auto_route.dart';
import 'package:movieapp/ui/views/doctor_view/doctor_view.dart';
import 'package:movieapp/ui/views/doctors_list/doctors_list_view.dart';
import 'package:movieapp/ui/views/home_page/home_page.dart';
import 'package:movieapp/ui/views/settings/settings_view.dart';

import 'views/main/main_view.dart';
import 'views/startup/start_up_view.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page', routes: <AutoRoute>[
  AutoRoute(page: StartUpView, initial: true),
  AutoRoute(page: HomePage),
  AutoRoute(page: DoctorsListView),
  AutoRoute(page: DoctorView),
  AutoRoute(page: SettingsView),
])
class $AppRouter {}
