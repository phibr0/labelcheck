// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de_DE locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'de_DE';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "about" : MessageLookupByLibrary.simpleMessage("über"),
    "aboutDescription" : MessageLookupByLibrary.simpleMessage("Ich habe diese App als Schulprojekt erstellt, sie ist quelloffen, also kannst du wenn du möchtest etwas beitragen (vorallem Übersetzungen). Das Github Repository ist verlinkt. Möchtest du sonstiges Feedback geben oder zum Beispiel Bilder für das Trainingsset beitragen kannst du sie mir auch per Email schicken."),
    "appName" : MessageLookupByLibrary.simpleMessage("labelcheck"),
    "close" : MessageLookupByLibrary.simpleMessage("Schließen"),
    "deviceShake" : MessageLookupByLibrary.simpleMessage("Bitte halte dein Handy still"),
    "feedback" : MessageLookupByLibrary.simpleMessage("Feedback via Email"),
    "hi" : MessageLookupByLibrary.simpleMessage("Hi, ich bin Phillip Bronzel\n"),
    "moreInfo" : MessageLookupByLibrary.simpleMessage("Mehr Informationen"),
    "privacy" : MessageLookupByLibrary.simpleMessage("Datenschutzerklärung"),
    "reportError" : MessageLookupByLibrary.simpleMessage("Fehlerbericht senden")
  };
}
