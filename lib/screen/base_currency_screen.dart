import 'package:currencyconvertor/screen/result_screen.dart';
import 'package:currencyconvertor/route/router.dart';
import 'package:currencyconvertor/screen/selected_currency_screen.dart';
import 'package:currencyconvertor/provider/app_state.dart';
import 'package:currencyconvertor/util/util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BaseCurrencyScreen extends StatefulWidget {
  @override
  _BaseCurrencyScreenState createState() => _BaseCurrencyScreenState();
}

class _BaseCurrencyScreenState extends State<BaseCurrencyScreen> {
  final TextEditingController _baseCurrencyController =
      new TextEditingController();
  bool _inValid = false;

  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context);

    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Spacer(flex: 2),
          Text("SIVISOFT",
              style: GoogleFonts.mcLaren(
                  textStyle: TextStyle(
                color: Colors.white,
                fontSize: 35,
              ))),
          Spacer(flex: 1,),
          Text("CURRENCY CONVERTER",
              style: GoogleFonts.mcLaren(
                  textStyle: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ))),
          Spacer(flex: 3),
          Padding(
            padding: const EdgeInsets.only(right:160.0),
            child: Text("Select your base",
                style: GoogleFonts.lato(
                    textStyle: TextStyle(

                  color: Colors.white,
                  fontSize: 20,

                ),)),
          ),


          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: TextField(
                  controller: _baseCurrencyController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                      hintText: "  Currency code(INR, USD, EUR...)",
                      errorText: _inValid ? "Enter valid value" : null,
                      ),
                ),
              ),
            ),
          ),
          Spacer(flex: 1,),
          FlatButton(
            child: Text("Next",
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ))),
            onPressed: () {

              if(!Util.validateCurrency(_baseCurrencyController.text)){
                setState(() {
                  _inValid=true;

                });
              } else{
                appState.setBaseCurrency(_baseCurrencyController.text.toUpperCase());
                Navigator.pushNamed(context, Router.selectedCurrencyRoute);
                _baseCurrencyController.clear();
              }

            },
          ),
          Spacer(flex:4)
        ],
      ),
    );
  }



}
