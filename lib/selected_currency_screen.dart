import 'package:currencyconvertor/router.dart';
import 'package:currencyconvertor/user.dart';
import 'package:currencyconvertor/util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectedCurrencyScreen extends StatelessWidget {

  final TextEditingController _selectedCurrencyController = new TextEditingController();


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
            padding: EdgeInsets.only(right: 8.0),
            child: Text("Base Currency : " + user.baseCurrency,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(

                    color: Colors.white,
                    fontSize: 20,

                  ),)),
          ),
          Spacer(flex: 1),
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Text("Currencies to compare",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(

                    color: Colors.white,
                    fontSize: 20,

                  ),)),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 18.0, vertical: 10.0),
            child: Row(
              children: <Widget>[

                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.75,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    controller: _selectedCurrencyController,
                    decoration: InputDecoration(
                        labelText: "  Currency code(INR, USD, EUR...)",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add,
                    size: 40,
                    color: Colors.white,),
                  onPressed: () {
                    String selectedCurrency = _selectedCurrencyController.text;
                    if (Util.validateCurrency(selectedCurrency)) {
                      Set<String> compareCurrencyList = user
                          .selectedCurrency ?? Set();
                      compareCurrencyList.add(_selectedCurrencyController.text);
                      user.setSelectedCurrency(compareCurrencyList);
                    }
                  },
                ),
              ],
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
              String selectedCurrency = _selectedCurrencyController.text;
              Set<String> compareCurrencyList = user.selectedCurrency ?? Set();
              if (Util.validateCurrency(selectedCurrency)) {
                compareCurrencyList.add(_selectedCurrencyController.text);
                user.setSelectedCurrency(compareCurrencyList);
                Navigator.pushNamed(
                    context,
                    Router.resultRoute);
              } else if(compareCurrencyList.isNotEmpty) {
                Navigator.pushNamed(
                    context,
                    Router.resultRoute);
              }
              else {
              print("Invalid code");
              }
            },
          ),
          Spacer(flex: 4)
        ],
      ),
    );
  }
}
