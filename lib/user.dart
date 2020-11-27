import 'package:flutter/material.dart';

class CurrencyConfig with ChangeNotifier {
  String _baseCurrency;
  Set<String> _selectedCurrency;

  String get baseCurrency => _baseCurrency;

  setBaseCurrency(String value) {
    _baseCurrency = value;
    notifyListeners();
  }

  Set<String> get selectedCurrency => _selectedCurrency;

  setSelectedCurrency(Set<String> value) {
    _selectedCurrency = value;
    notifyListeners();
  }
}
