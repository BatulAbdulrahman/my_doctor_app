// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(firstName) => "مرحباً ${firstName}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about_app": MessageLookupByLibrary.simpleMessage("About App"),
        "about_developers":
            MessageLookupByLibrary.simpleMessage("About developers"),
        "empty_list": MessageLookupByLibrary.simpleMessage("Empty list"),
        "exception_indicator_try_again":
            MessageLookupByLibrary.simpleMessage("Try again"),
        "generic_error_indicator_error_while_fetching_data":
            MessageLookupByLibrary.simpleMessage(
                "An error occurred while fetching data"),
        "main_view_home": MessageLookupByLibrary.simpleMessage("Home"),
        "main_view_settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "no_connection_indicator_no_connection":
            MessageLookupByLibrary.simpleMessage("No connection"),
        "no_connection_indicator_try_again_later":
            MessageLookupByLibrary.simpleMessage("Please try again later"),
        "not_authorized_indicator_login_register":
            MessageLookupByLibrary.simpleMessage("Register/Login"),
        "not_authorized_indicator_you_need_to_login_to_see_this_page":
            MessageLookupByLibrary.simpleMessage(
                "To be able to see the contents of this page, you must be logged in"),
        "pageHomeTitle": m0,
        "sadeem_tech_co": MessageLookupByLibrary.simpleMessage("SadeemTech"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "settings_view_about": MessageLookupByLibrary.simpleMessage("About"),
        "settings_view_notification":
            MessageLookupByLibrary.simpleMessage("Notifications"),
        "version": MessageLookupByLibrary.simpleMessage("Version")
      };
}
