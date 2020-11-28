import 'package:currencyconvertor/screen/login_screen.dart';
import 'package:currencyconvertor/screen/result_screen.dart';
import 'package:currencyconvertor/screen/base_currency_screen.dart';
import 'package:currencyconvertor/screen/selected_currency_screen.dart';
import 'package:flutter/material.dart';

class Router {

  static const String loginPageRoute = '/';
  static const String baseCurrencyRoute = '/baseCurrency';
  static const String selectedCurrencyRoute = '/selectedCurrency';
  static const String resultRoute = '/result';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPageRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case baseCurrencyRoute:
        return MaterialPageRoute(builder: (_) => BaseCurrencyScreen());
      case selectedCurrencyRoute:
        return MaterialPageRoute(builder: (_) => SelectedCurrencyScreen());
      case resultRoute:
        return MaterialPageRoute(builder: (_) => ResultScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }

  }
}