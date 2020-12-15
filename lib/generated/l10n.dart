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
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `labelcheck`
  String get appName {
    return Intl.message(
      'labelcheck',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Please hold the Device still`
  String get deviceShake {
    return Intl.message(
      'Please hold the Device still',
      name: 'deviceShake',
      desc: '',
      args: [],
    );
  }

  /// `about`
  String get about {
    return Intl.message(
      'about',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Hi, I am Phillip Bronzel\n`
  String get hi {
    return Intl.message(
      'Hi, I am Phillip Bronzel\n',
      name: 'hi',
      desc: '',
      args: [],
    );
  }

  /// `I created this App as a School Project, it's Open Source, so if you want to contribute (Translations would be helpful) you can check out the GitHub Repo below. If you want to give Feedback, or provide more images for the Dataset you can send me an Email.`
  String get aboutDescription {
    return Intl.message(
      'I created this App as a School Project, it\'s Open Source, so if you want to contribute (Translations would be helpful) you can check out the GitHub Repo below. If you want to give Feedback, or provide more images for the Dataset you can send me an Email.',
      name: 'aboutDescription',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Feedback via Email`
  String get feedback {
    return Intl.message(
      'Feedback via Email',
      name: 'feedback',
      desc: '',
      args: [],
    );
  }

  /// `Report Error`
  String get reportError {
    return Intl.message(
      'Report Error',
      name: 'reportError',
      desc: '',
      args: [],
    );
  }

  /// `More information`
  String get moreInfo {
    return Intl.message(
      'More information',
      name: 'moreInfo',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de', countryCode: 'DE'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}