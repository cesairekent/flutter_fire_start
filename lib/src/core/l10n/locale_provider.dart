import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier
{
  Locale localeLang = const Locale('fr');

  Locale get locale{
    return localeLang;
  }

  setLocale(Locale locale) async{
    final prefs = await  SharedPreferences.getInstance();
    prefs.setString('language', locale.languageCode);
    localeLang = locale;
    notifyListeners();
  }

  void clearLocale()
  {
    //_locale = null;
    notifyListeners();
  }
}