import 'package:currencyconvertor/screen/login_screen.dart';
import 'package:currencyconvertor/route/router.dart';
import 'package:currencyconvertor/provider/currency_inventory.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrencyInventory(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Currency Converter',
        onGenerateRoute: Router.generateRoute,
        home: LoginScreen(),
      ),
    );
  }
}
