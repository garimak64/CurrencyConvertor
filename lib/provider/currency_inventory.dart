import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CurrencyInventory with ChangeNotifier {
  String _baseCurrency;
  Set<String> _selectedCurrency;
  GoogleSignIn _googleSignIn;

  GoogleSignIn get googleAccount => _googleSignIn;

  setGoogleAccount(GoogleSignIn val) => _googleSignIn = val;

  String get baseCurrency => _baseCurrency;

  setBaseCurrency(String value) {
    _baseCurrency = value;
    notifyListeners();
  }

  Set<String> get selectedCurrency {
    if (_selectedCurrency == null) {
      _selectedCurrency = Set();
    }
    return _selectedCurrency;
  }

  setSelectedCurrency(Set<String> value) {
    if (_selectedCurrency.contains(_baseCurrency)) value.remove(_baseCurrency);
    _selectedCurrency = value;

    notifyListeners();
  }
}
