import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier
{
  Locale _locale = const Locale('fr');

  Locale get locale{
    return _locale;
  }

  // Future<Locale> get locale async{
  //   final prefs = await  SharedPreferences.getInstance();
  //   String lang = prefs.getString('language')??'fr';
  //   return Locale(lang);
  // }

  //LocaleProvider(this._locale);

  setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  void clearLocale()
  {
    //_locale = null;
    notifyListeners();
  }
}