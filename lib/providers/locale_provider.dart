import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  String _locale = 'id';

  String get locale => _locale;
  bool get isEnglish => _locale == 'en';

  void toggleLocale() {
    _locale = _locale == 'id' ? 'en' : 'id';
    notifyListeners();
  }
}
