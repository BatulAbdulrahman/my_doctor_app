// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `مرحباً {firstName}`
  String pageHomeTitle(Object firstName) {
    return Intl.message(
      'مرحباً $firstName',
      name: 'pageHomeTitle',
      desc: 'هذا فقط مجرد مثال لشرح قدرة الترجمة على وضع نصوصو بديلة ',
      args: [firstName],
    );
  }

  /// `الاخبار`
  String get main_view_home {
    return Intl.message(
      'الاخبار',
      name: 'main_view_home',
      desc: '',
      args: [],
    );
  }

  /// `الضبط`
  String get main_view_settings {
    return Intl.message(
      'الضبط',
      name: 'main_view_settings',
      desc: '',
      args: [],
    );
  }

  /// `عن التطبيق`
  String get about_app {
    return Intl.message(
      'عن التطبيق',
      name: 'about_app',
      desc: '',
      args: [],
    );
  }

  /// `الضبط`
  String get settings {
    return Intl.message(
      'الضبط',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `النسخة`
  String get version {
    return Intl.message(
      'النسخة',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `عن المبرمجين`
  String get about_developers {
    return Intl.message(
      'عن المبرمجين',
      name: 'about_developers',
      desc: '',
      args: [],
    );
  }

  /// `شركة سديم التقنية`
  String get sadeem_tech_co {
    return Intl.message(
      'شركة سديم التقنية',
      name: 'sadeem_tech_co',
      desc: '',
      args: [],
    );
  }

  /// `قائمة فارغة`
  String get empty_list {
    return Intl.message(
      'قائمة فارغة',
      name: 'empty_list',
      desc: '',
      args: [],
    );
  }

  /// `المحاولة مرة أخرى`
  String get exception_indicator_try_again {
    return Intl.message(
      'المحاولة مرة أخرى',
      name: 'exception_indicator_try_again',
      desc: '',
      args: [],
    );
  }

  /// `حدث خطأاثناء جلب البيانات`
  String get generic_error_indicator_error_while_fetching_data {
    return Intl.message(
      'حدث خطأاثناء جلب البيانات',
      name: 'generic_error_indicator_error_while_fetching_data',
      desc: '',
      args: [],
    );
  }

  /// `الاشعارات`
  String get settings_view_notification {
    return Intl.message(
      'الاشعارات',
      name: 'settings_view_notification',
      desc: '',
      args: [],
    );
  }

  /// `عن التطبيق`
  String get settings_view_about {
    return Intl.message(
      'عن التطبيق',
      name: 'settings_view_about',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد اتصال`
  String get no_connection_indicator_no_connection {
    return Intl.message(
      'لا يوجد اتصال',
      name: 'no_connection_indicator_no_connection',
      desc: '',
      args: [],
    );
  }

  /// `الرجاء المحاولة في وقت لاحق`
  String get no_connection_indicator_try_again_later {
    return Intl.message(
      'الرجاء المحاولة في وقت لاحق',
      name: 'no_connection_indicator_try_again_later',
      desc: '',
      args: [],
    );
  }

  /// `لنتمكن من رؤية محتويات هذه الصفحة يتوجب عليك الدخول اولاً`
  String get not_authorized_indicator_you_need_to_login_to_see_this_page {
    return Intl.message(
      'لنتمكن من رؤية محتويات هذه الصفحة يتوجب عليك الدخول اولاً',
      name: 'not_authorized_indicator_you_need_to_login_to_see_this_page',
      desc: '',
      args: [],
    );
  }

  /// `التسجيل/ الدخول`
  String get not_authorized_indicator_login_register {
    return Intl.message(
      'التسجيل/ الدخول',
      name: 'not_authorized_indicator_login_register',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
