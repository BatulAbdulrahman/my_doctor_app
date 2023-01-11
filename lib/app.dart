import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:movieapp/provider_setup.dart';
import 'package:movieapp/ui/router.gr.dart';
import 'package:movieapp/ui/shared/themes.dart';

import 'core/services/key_storage/key_storage_service.dart';
import 'generated/l10n.dart';
import 'locator.dart';

Future<Widget> initializeApp() async {
  return MyApp();
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp();

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    locator<KeyStorageService>().locale = 'en';

    if (locator<KeyStorageService>().locale!.isEmpty) {
      locator<KeyStorageService>().locale = ui.window.locale.languageCode;
    }

    return MultiProvider(
      providers: providers,
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
        theme: primaryMaterialTheme,
        themeMode: ThemeMode.light,
        locale: Locale(locator<KeyStorageService>().locale!, ''),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', ''), // English, no country code
          Locale('ar', ''), // Arabic, no country code
        ],
        localeResolutionCallback: (deviceLocale, supportedLocales) {
          //myLocale = deviceLocale ; // here you make your app language similar to device language , but you should check whether the localization is supported by your app
        },
        onGenerateTitle: (context) => '',
      ),
    );
  }
}
