import 'package:currencyconvertor/result.dart';
import 'package:currencyconvertor/router.dart';
import 'package:currencyconvertor/selected_currency_screen.dart';
import 'package:currencyconvertor/user.dart';
import 'package:currencyconvertor/util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BaseCurrencyScreen extends StatelessWidget {
  final TextEditingController _baseCurrencyController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    CurrencyConfig user = Provider.of<CurrencyConfig>(context);
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Spacer(flex: 3),
          Text("SIVISOFT",
              style: GoogleFonts.mcLaren(
                  textStyle: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ))),
          Spacer(),
          Text("CURRENCY CONVERTER",
              style: GoogleFonts.mcLaren(
                  textStyle: TextStyle(
                color: Colors.white,
                fontSize: 28,
              ))),
          Spacer(flex: 1),
          Padding(
            padding:  EdgeInsets.only(right :8.0),
            child: Text("Select your base",
                style: GoogleFonts.lato(
                    textStyle: TextStyle(

                  color: Colors.white,
                  fontSize: 20,

                ),)),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(
                controller: _baseCurrencyController,
                decoration: InputDecoration(
                    labelText: "  Currency code(INR, USD, EUR...)",
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    )),
              ),
            ),
          ),
          FlatButton(
            child: Text("Next",
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ))),
            onPressed: () {
              String baseCurrency = _baseCurrencyController.text;
              if (Util.validateCurrency(baseCurrency)) {
                user.setBaseCurrency(baseCurrency);
                Navigator.pushNamed(
                    context,
                    Router.selectedCurrencyRoute);
              } else {
                 print("Invalid code");
              }
            },
          ),
          Spacer(flex:4)
        ],
      ),
    );
  }
}
