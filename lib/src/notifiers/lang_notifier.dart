import 'package:flutter/material.dart';
import 'package:flutter_wikobo/core/utils/shared_preferences.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
//final langProvider = StateProvider((ref) => LangNotifier());
final langChangeProvider = ChangeNotifierProvider((ref) => LangNotifier());

class LangNotifier extends ChangeNotifier {
  Locale _appLocale = Locale('vi');

  Locale get appLocal => _appLocale ?? Locale("vi");

  fetchLocale() async {
    var prefs = await SpUtil.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = Locale('vi');
      return Null;
    }
    _appLocale = Locale(prefs.getString('language_code'));
    return Null;
  }

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