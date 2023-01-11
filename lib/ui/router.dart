import 'package:auto_route/auto_route.dart';
import 'package:movieapp/ui/views/Home_page/home_page.dart';
import 'package:movieapp/ui/views/settings/settings_view.dart';

import 'views/main/main_view.dart';
import 'views/startup/start_up_view.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page', routes: <AutoRoute>[
  AutoRoute(page: StartUpView, initial: true),
  //AutoRoute(page: CustomerMainView),
  AutoRoute(page: HomePage),
  AutoRoute(page: SettingsView),
])
class $AppRouter {}
