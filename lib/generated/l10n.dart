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

  /// `Privacy Policy`
  String get privacy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// `Crop the Image`
  String get guide {
    return Intl.message(
      'Crop the Image',
      name: 'guide',
      desc: '',
      args: [],
    );
  }

  /// `For the Demeter label, at least 90% of the ingredients must also bear the Demeter label, the product may only contain aromas and extracts from the named plant and a total of only 22 additives are permitted. Genetic engineering is also completely excluded. However, every company must keep animals, but dehorning shouldn't be performed and the keeping of polled breeds is also prohibited. The entire company must operate ecologically.`
  String get demeter {
    return Intl.message(
      'For the Demeter label, at least 90% of the ingredients must also bear the Demeter label, the product may only contain aromas and extracts from the named plant and a total of only 22 additives are permitted. Genetic engineering is also completely excluded. However, every company must keep animals, but dehorning shouldn\'t be performed and the keeping of polled breeds is also prohibited. The entire company must operate ecologically.',
      name: 'demeter',
      desc: '',
      args: [],
    );
  }

  /// `The product does not contain any colorings, flavor enhancers, artificial flavors, stabilizers or synthetic sweeteners. Animals have a little more space than in conventional animal husbandry and their feed contains neither antibiotics nor performance hormones. Genetic engineering is allowed up to 0.9% and some practices that are harmful to the environment, for example to combat fungi, may still be used.`
  String get bio {
    return Intl.message(
      'The product does not contain any colorings, flavor enhancers, artificial flavors, stabilizers or synthetic sweeteners. Animals have a little more space than in conventional animal husbandry and their feed contains neither antibiotics nor performance hormones. Genetic engineering is allowed up to 0.9% and some practices that are harmful to the environment, for example to combat fungi, may still be used.',
      name: 'bio',
      desc: '',
      args: [],
    );
  }

  /// `For the Bioland label, the entire company must be organic and verifiably save water. Frequent grazing of the animals is mandatory. Vegetables may only be grown on natural soil and no genetic engineering whatsoever may be used. Recyclable packaging is also required.`
  String get bioland {
    return Intl.message(
      'For the Bioland label, the entire company must be organic and verifiably save water. Frequent grazing of the animals is mandatory. Vegetables may only be grown on natural soil and no genetic engineering whatsoever may be used. Recyclable packaging is also required.',
      name: 'bioland',
      desc: '',
      args: [],
    );
  }

  /// `This label is valid throughout the EU. Products from other EU countries must meet the relevant criteria. Only 44 additives (instead of over 300 in conventional agriculture) are tolerated. This label is, however, under strong criticism, because farms do not have to be fully converted to organic production, animals can still be fed with genetically modified feed, and meat, blood and bone meal can be used as fertilizer. There are also no regulations for observing human rights at the courts.`
  String get eulabel {
    return Intl.message(
      'This label is valid throughout the EU. Products from other EU countries must meet the relevant criteria. Only 44 additives (instead of over 300 in conventional agriculture) are tolerated. This label is, however, under strong criticism, because farms do not have to be fully converted to organic production, animals can still be fed with genetically modified feed, and meat, blood and bone meal can be used as fertilizer. There are also no regulations for observing human rights at the courts.',
      name: 'eulabel',
      desc: '',
      args: [],
    );
  }

  /// `The Fairtrade label promises humane working conditions for the farmer, the abolition of child labor, and fixed prices for the farmer, so that he is no longer dependent on the strongly fluctuating world market prices. Fairtrade products also offer the possibility of tracing the production steps. In the past, however, this label has also received criticism, so "fair" and "unfair" ingredients can be mixed and the end product can still bear the label, albeit with a marked amount compensation. The pricing is also opaque, so the product is sometimes significantly more expensive, but the farmer does not receive this large part by far.`
  String get fairtrade {
    return Intl.message(
      'The Fairtrade label promises humane working conditions for the farmer, the abolition of child labor, and fixed prices for the farmer, so that he is no longer dependent on the strongly fluctuating world market prices. Fairtrade products also offer the possibility of tracing the production steps. In the past, however, this label has also received criticism, so "fair" and "unfair" ingredients can be mixed and the end product can still bear the label, albeit with a marked amount compensation. The pricing is also opaque, so the product is sometimes significantly more expensive, but the farmer does not receive this large part by far.',
      name: 'fairtrade',
      desc: '',
      args: [],
    );
  }

  /// `The MSC label promises to prevent overfishing, the functionality and biodiversity of all affected ecosystems must not be impaired and all regional and international laws must be observed. But there are also many criticisms, so Greenpeace claims, MSC would issue the label too early and a "promise" to MSC: "In the future something will improve" is enough to get the certification. In some cases, problematic fishing methods may still be used, which for example cause damage to the seabed.`
  String get msc {
    return Intl.message(
      'The MSC label promises to prevent overfishing, the functionality and biodiversity of all affected ecosystems must not be impaired and all regional and international laws must be observed. But there are also many criticisms, so Greenpeace claims, MSC would issue the label too early and a "promise" to MSC: "In the future something will improve" is enough to get the certification. In some cases, problematic fishing methods may still be used, which for example cause damage to the seabed.',
      name: 'msc',
      desc: '',
      args: [],
    );
  }

  /// `The "ohne Gentechnik" label prevents the use of genetically modified organisms and parts thereof, and animal feed is also produced without genetic engineering. The use of genetically modified vitamins, flavors, enzymes and other food additives is also prevented.`
  String get ohneGen {
    return Intl.message(
      'The "ohne Gentechnik" label prevents the use of genetically modified organisms and parts thereof, and animal feed is also produced without genetic engineering. The use of genetically modified vitamins, flavors, enzymes and other food additives is also prevented.',
      name: 'ohneGen',
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