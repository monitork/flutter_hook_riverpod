import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hook_riverpod_example/core/utils/shared_preferences.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//final langProvider = StateProvider((ref) => LangNotifier());
final langChangeProvider = ChangeNotifierProvider((ref) => LangNotifier());

class LangNotifier extends ChangeNotifier {
  Locale _appLocale = Locale('vi');
  Locale _deviceLocal;

  Locale get appLocal => _appLocale ?? Locale("vi");

  fetchLocale() async {
    var defaultLocale = Platform.localeName.split('_');
    String languageCode = defaultLocale[0];
    String countryCode = defaultLocale[1];
    var prefs = await SpUtil.getInstance();
    if (prefs.getString('language_code') == null && _deviceLocal == null) {
      _appLocale = Locale('en');
    } else if (_deviceLocal != null) {
      _appLocale = _deviceLocal;
    }
    _appLocale = Locale(prefs.getString('language_code'));
  }

//  Locale deviceLocale(locale, supportedLocales) {
//    if (locale == null) {
//      _deviceLocal = Locale(locale.countryCode);
//      notifyListeners();
//      return Locale(locale.countryCode);
//    } else {
//      return Locale('en');
//    }
//  }

  void changeLanguage(Locale type) async {
    var prefs = await SpUtil.getInstance();
    if (_appLocale == type) {
      return;
    }
    if (type == Locale("vi")) {
      _appLocale = Locale("vi");
      await prefs.putString('language_code', 'vi');
      await prefs.putString('countryCode', 'VN');
    } else {
      _appLocale = Locale("en");
      await prefs.putString('language_code', 'en');
      await prefs.putString('countryCode', 'US');
    }
    notifyListeners();
  }
}
