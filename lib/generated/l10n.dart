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

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get Phone {
    return Intl.message(
      'Phone',
      name: 'Phone',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Please fill the data correctly`
  String get Please {
    return Intl.message(
      'Please fill the data correctly',
      name: 'Please',
      desc: '',
      args: [],
    );
  }

  /// `This field cannot be empty`
  String get Empty {
    return Intl.message(
      'This field cannot be empty',
      name: 'Empty',
      desc: '',
      args: [],
    );
  }

  /// `Create a new account?`
  String get craete {
    return Intl.message(
      'Create a new account?',
      name: 'craete',
      desc: '',
      args: [],
    );
  }

  /// `Registeration`
  String get Registeration {
    return Intl.message(
      'Registeration',
      name: 'Registeration',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get Register {
    return Intl.message(
      'Register',
      name: 'Register',
      desc: '',
      args: [],
    );
  }

  /// `already have an account?`
  String get already {
    return Intl.message(
      'already have an account?',
      name: 'already',
      desc: '',
      args: [],
    );
  }

  /// `Home Page`
  String get Home {
    return Intl.message(
      'Home Page',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Can't connect .. check internet`
  String get cant {
    return Intl.message(
      'Can\'t connect .. check internet',
      name: 'cant',
      desc: '',
      args: [],
    );
  }

  /// `Category:    \t  `
  String get Category {
    return Intl.message(
      'Category:    \t  ',
      name: 'Category',
      desc: '',
      args: [],
    );
  }

  /// `Price:       \t\t \t   `
  String get price {
    return Intl.message(
      'Price:       \t\t \t   ',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Description:   `
  String get Description {
    return Intl.message(
      'Description:   ',
      name: 'Description',
      desc: '',
      args: [],
    );
  }

  /// `Arabic language`
  String get ChangeLan {
    return Intl.message(
      'Arabic language',
      name: 'ChangeLan',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
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
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
