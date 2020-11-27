import 'package:currencyconvertor/google_login.dart';
import 'package:currencyconvertor/router.dart';
import 'package:currencyconvertor/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currency Converter',
      onGenerateRoute: Router.generateRoute,
      home: LoginPageWidget(),
    );
  }
}
