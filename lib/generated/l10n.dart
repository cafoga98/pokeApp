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

  /// `Loading`
  String get loading {
    return Intl.message(
      'Loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `No Internet conection`
  String get noConnection {
    return Intl.message(
      'No Internet conection',
      name: 'noConnection',
      desc: '',
      args: [],
    );
  }

  /// `Problems connecting to the server`
  String get timeOut {
    return Intl.message(
      'Problems connecting to the server',
      name: 'timeOut',
      desc: '',
      args: [],
    );
  }

  /// `No Data`
  String get noData {
    return Intl.message(
      'No Data',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `No authorization for application`
  String get unauthorised {
    return Intl.message(
      'No authorization for application',
      name: 'unauthorised',
      desc: '',
      args: [],
    );
  }

  /// `Failed to save the information, please try again later`
  String get noSaveLocalData {
    return Intl.message(
      'Failed to save the information, please try again later',
      name: 'noSaveLocalData',
      desc: '',
      args: [],
    );
  }

  /// `Problems connecting to internal database, please try again later`
  String get timeOutLocal {
    return Intl.message(
      'Problems connecting to internal database, please try again later',
      name: 'timeOutLocal',
      desc: '',
      args: [],
    );
  }

  /// `Mandatory field`
  String get mandatoryField {
    return Intl.message(
      'Mandatory field',
      name: 'mandatoryField',
      desc: '',
      args: [],
    );
  }

  /// `Could not launch`
  String get noLaunch {
    return Intl.message(
      'Could not launch',
      name: 'noLaunch',
      desc: '',
      args: [],
    );
  }

  /// `Sing Up With`
  String get singUp {
    return Intl.message(
      'Sing Up With',
      name: 'singUp',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password ?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password ?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
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

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Logging in, please wait a moment ...`
  String get loadingLogin {
    return Intl.message(
      'Logging in, please wait a moment ...',
      name: 'loadingLogin',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect credentials`
  String get wrongCredentials {
    return Intl.message(
      'Incorrect credentials',
      name: 'wrongCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Loading information`
  String get loadingInformation {
    return Intl.message(
      'Loading information',
      name: 'loadingInformation',
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

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Pokemon List`
  String get pokemonList {
    return Intl.message(
      'Pokemon List',
      name: 'pokemonList',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Pokemon Detail`
  String get pokemonDetails {
    return Intl.message(
      'Pokemon Detail',
      name: 'pokemonDetails',
      desc: '',
      args: [],
    );
  }

  /// `Height`
  String get height {
    return Intl.message(
      'Height',
      name: 'height',
      desc: '',
      args: [],
    );
  }

  /// `Types`
  String get types {
    return Intl.message(
      'Types',
      name: 'types',
      desc: '',
      args: [],
    );
  }

  /// `Moves`
  String get moves {
    return Intl.message(
      'Moves',
      name: 'moves',
      desc: '',
      args: [],
    );
  }

  /// `View JSON`
  String get viewJson {
    return Intl.message(
      'View JSON',
      name: 'viewJson',
      desc: '',
      args: [],
    );
  }

  /// `Search by pokemon name`
  String get searchByName {
    return Intl.message(
      'Search by pokemon name',
      name: 'searchByName',
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
