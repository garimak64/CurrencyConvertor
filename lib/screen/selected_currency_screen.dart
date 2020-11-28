import 'package:currencyconvertor/route/router.dart';
import 'package:currencyconvertor/provider/currency_inventory.dart';
import 'package:currencyconvertor/util/util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectedCurrencyScreen extends StatefulWidget {
  @override
  _SelectedCurrencyScreenState createState() => _SelectedCurrencyScreenState();
}

class _SelectedCurrencyScreenState extends State<SelectedCurrencyScreen> {
  final TextEditingController _selectedCurrencyController =
      new TextEditingController();
  final Key scaffoldKey = Key("showSnackBar");

  bool _inValid = false;
  String errMsg = "";

  @override
  Widget build(BuildContext context) {
    CurrencyInventory currencyInventory =
        Provider.of<CurrencyInventory>(context);
    return Scaffold(
      backgroundColor: Colors.indigo,
      key: scaffoldKey,
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
                fontSize: 22,
              ))),
          Spacer(flex: 2),
          Padding(
            padding: const EdgeInsets.only(right:140.0),
            child: Text("Base Currency: " + currencyInventory.baseCurrency,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )),
          ),
          Spacer(flex: 1),
          Padding(
            padding: const EdgeInsets.only(right:130.0),
            child: Text("Currencies to compare",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )),
          ),
          Spacer(flex: 1,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: TextField(
                      controller: _selectedCurrencyController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: " Currency code(INR, USD, EUR...)",
                          errorText: _inValid ? errMsg : "",
                          ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 40,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    String selectedCurrency = _selectedCurrencyController.text.toUpperCase();
                    if (Util.validateCurrency(selectedCurrency) && selectedCurrency!=currencyInventory.baseCurrency) {
                      Set<String> compareCurrencyList =
                          currencyInventory.selectedCurrency;
                      compareCurrencyList.add(_selectedCurrencyController.text.toUpperCase());
                      _selectedCurrencyController.clear();
                    } else {
                      setState(() {
                        _inValid = true;
                        errMsg =
                            selectedCurrency==currencyInventory.baseCurrency
                            ? "Cannot be the same as base currency" :
                              "Enter valid currency to compare";
                      });
                    }
                  },
                ),
              ],
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
              String selectedCurrency = _selectedCurrencyController.text.toUpperCase();
              Set<String> compareCurrencyList =
                  currencyInventory.selectedCurrency;
              if (Util.validateCurrency(selectedCurrency) && selectedCurrency!=currencyInventory.baseCurrency) {
                compareCurrencyList.add(_selectedCurrencyController.text.toUpperCase());
                Navigator.pushNamed(context, Router.resultRoute);
                _selectedCurrencyController.clear();
              } else if (selectedCurrency.isEmpty && compareCurrencyList.isNotEmpty) {
                Navigator.pushNamed(context, Router.resultRoute);
                _selectedCurrencyController.clear();
              } else if( selectedCurrency==currencyInventory.baseCurrency) {
                setState(() {
                  _inValid = true;
                  errMsg = "Cannot be the same as base currency";
                });
              }
              else {
                setState(() {
                  _inValid = true;
                  errMsg = compareCurrencyList.isEmpty ? "Enter atleast one currency to compare" : "Enter Valid currency";
                });
              }
            },
          ),
          Spacer(flex: 4)
        ],
      ),
    );
  }
}
