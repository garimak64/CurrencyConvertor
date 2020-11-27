import 'package:currencyconvertor/google_login.dart';
import 'package:currencyconvertor/result.dart';
import 'package:currencyconvertor/base_currency_screen.dart';
import 'package:currencyconvertor/selected_currency_screen.dart';
import 'package:flutter/material.dart';

class Router {

  static const String loginPageRoute = '/';
  static const String baseCurrencyRoute = '/baseCurrency';
  static const String selectedCurrencyRoute = '/selectedCurrency';
  static const String resultRoute = '/result';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPageRoute:
        return MaterialPageRoute(builder: (_) => LoginPageWidget());
      case baseCurrencyRoute:
        return MaterialPageRoute(builder: (_) => BaseCurrencyScreen());
      case selectedCurrencyRoute:
        return MaterialPageRoute(builder: (_) => SelectedCurrencyScreen());
      case resultRoute:
        return MaterialPageRoute(builder: (_) => Result());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }

  }
}