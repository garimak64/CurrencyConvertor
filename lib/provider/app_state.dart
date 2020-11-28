import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  String _baseCurrency;
  bool _isUserSignedIn = false;
  Set<String> _selectedCurrency;

  bool getIsUserSignedIn() => _isUserSignedIn;

  setIsUserSignedIn(bool value) {
    _isUserSignedIn = value;
    notifyListeners();
  }

  String get baseCurrency => _baseCurrency;

  setBaseCurrency(String value) {
    _baseCurrency = value;
    notifyListeners();
  }

  Set<String> get selectedCurrency {
    if(_selectedCurrency == null) {
      _selectedCurrency = Set();
    }
    return _selectedCurrency;
  }

  setSelectedCurrency(Set<String> value) {
    if(_selectedCurrency.contains(_baseCurrency))
      value.remove(_baseCurrency);
    _selectedCurrency = value;

    notifyListeners();
  }
}
