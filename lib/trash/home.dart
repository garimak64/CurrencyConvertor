//import 'package:currencyconvertor/result.dart';
//import 'package:currencyconvertor/user.dart';
//import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
//
//class BaseCurrency extends StatelessWidget {
//  final TextEditingController _baseCurrencyController =
//      new TextEditingController();
//  final TextEditingController _selectedCurrencyController =
//      new TextEditingController();
//  final User u = User();
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.blue,
//      body: Padding(
//        padding: const EdgeInsets.all(18.0),
//        child: Center(
//          child: Column(
//            children: <Widget>[
//              Text(
//                "Sivisoft",
//                style:
//                    GoogleFonts.mcLaren(textStyle: TextStyle(fontSize: 18.0)),
//              ),
//              Text(
//                "Currency Converter",
//                style:
//                    GoogleFonts.mcLaren(textStyle: TextStyle(fontSize: 14.0)),
//              ),
//              TextField(
//                controller: _baseCurrencyController,
//                style: TextStyle(color: Colors.white),
//                decoration: new InputDecoration(
//                  labelText: "Enter base currency",
//                  fillColor: Colors.white,
//                  border: new OutlineInputBorder(
//                    borderRadius: new BorderRadius.circular(25.0),
//                    borderSide: new BorderSide(),
//                  ),
//                  //fillColor: Colors.green
//                ),
//              ),
//              Row(
//                children: <Widget>[
//                  TextField(
//                    controller: _selectedCurrencyController,
//                    style: TextStyle(color: Colors.white),
//                    decoration: new InputDecoration(
//                      labelText: "Enter base currency",
//                      fillColor: Colors.white,
//                      border: new OutlineInputBorder(
//                        borderRadius: new BorderRadius.circular(25.0),
//                        borderSide: new BorderSide(),
//                      ),
//                      //fillColor: Colors.green
//                    ),
//                  ),
//                  RaisedButton(child: Text("+"),
//                    onPressed:() {
//                      String currencyToCompare = _selectedCurrencyController.text;
//                      if(_validateCurrency(currencyToCompare)) {
//                        Set<String> currenciesToCompare = u.selectedCurrency ?? Set;
//                        currenciesToCompare.add(currencyToCompare);
//                      }
//                  },),
//                ],
//              ),
//              RaisedButton(
//                child: Text(
//                  "Submit",
//                  style: TextStyle(color: Colors.white),
//                ),
//                onPressed: () {
//                  u.setBaseCurrency(_baseCurrencyController.text);
//                  Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                        builder: (context) => Result(),
//                      ));
//                },
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//
//  bool _validateCurrency(String currency) {
//    return true;
//  }
//}
