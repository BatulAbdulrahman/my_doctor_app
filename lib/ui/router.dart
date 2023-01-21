import 'package:auto_route/auto_route.dart';
import 'package:movieapp/ui/views/clinic_view/clinic_view.dart';
import 'package:movieapp/ui/views/clinics_list/clinics_list_view.dart';
import 'package:movieapp/ui/views/doctor_view/doctor_view.dart';
import 'package:movieapp/ui/views/doctors_list/doctors_list_view.dart';
import 'package:movieapp/ui/views/home_page/home_page.dart';
import 'package:movieapp/ui/views/login%20and%20signup/login_page.dart';
import 'package:movieapp/ui/views/contact_us/contact_us_view.dart';
import 'package:movieapp/ui/views/onboarding_view/onboarding_view.dart';

import 'views/main/main_view.dart';
import 'views/startup/start_up_view.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page', routes: <AutoRoute>[
  AutoRoute(page: StartUpView, initial: true),
  AutoRoute(page: OnboardingView),
  AutoRoute(page: HomePage),
  AutoRoute(page: DoctorsListView),
  AutoRoute(page: DoctorView),
  AutoRoute(page: ClinicsListView),
  AutoRoute(page: ClinicView),
  AutoRoute(page: LoginPage),
])
class $AppRouter {}
