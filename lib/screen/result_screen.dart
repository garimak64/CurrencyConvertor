import 'package:currencyconvertor/api/exchange_api.dart';
import 'package:currencyconvertor/modal/exchange_modal.dart';
import 'package:currencyconvertor/provider/currency_inventory.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Future<Exchange> getData(CurrencyInventory currencyInventory) {
    return ExchangeApi().fetchExchange(currencyInventory.baseCurrency);
  }

  @override
  Widget build(BuildContext context) {
    CurrencyInventory currencyInventory =
        Provider.of<CurrencyInventory>(context);
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: FutureBuilder<Exchange>(
          future: getData(currencyInventory),
          //snapshot of the context/getData
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                    child: Text(
                  "Loading...",
                  style: TextStyle(color: Colors.amber, fontSize: 25.0),
                  textAlign: TextAlign.center,
                ));
              default:
                if (snapshot.hasError) {
                  return Text(
                    "Error :(",
                    style: TextStyle(color: Colors.amber, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  );
                } else {
                  List<String> compareCurrencyList =
                      currencyInventory.selectedCurrency.toList();
                  compareCurrencyList.sort();

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Spacer(flex: 2),
                      Text("SIVISOFT",
                          style: GoogleFonts.mcLaren(
                              textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                          ))),
                      Spacer(flex: 1),
                      Text("CURRENCY CONVERTER",
                          style: GoogleFonts.mcLaren(
                              textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ))),
                      Spacer(flex: 1),
                      Row(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          Icon(
                            Icons.refresh,
                            color: Colors.white,
                          ),
                          GestureDetector(
                            onTap: () => setState(() {}),
                            child: Text("Refresh",
                                style: GoogleFonts.mcLaren(
                                    textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ))),
                          ),

                        ],
                      ),
                      Spacer(flex: 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                            Text(
                              currencyInventory.baseCurrency +
                                  " Value: 1 " +
                                  currencyInventory.baseCurrency,
                              style: TextStyle(color: Colors.white, fontSize: 18,
                              fontWeight: FontWeight.bold),
                            ),

                            GestureDetector(
                                onTap: () {
                                  int count = 0;
                                  Navigator.popUntil(context, (route) {
                                    return count++ == 2;
                                  });
                                  //Navigator.popUntil(context, ModalRoute.withName(Router.baseCurrencyRoute));
                                  // Navigator.of(context).popUntil((route) => route.settings.name == Router.baseCurrencyRoute);
                                },
                                child: Text(
                                  "Edit Base Currency",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )),

                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "Today's Value",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),

                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "+ Add more Currency",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),

                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: compareCurrencyList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              compareCurrencyList[index] +
                                  ": " +
                                  snapshot.data
                                      .getExchangeRate(
                                          compareCurrencyList[index])
                                      .toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          );
                        },
                      ),
                      Spacer(flex: 3),
                      GestureDetector(
                        onTap: () {
                          GoogleSignIn signIn = new GoogleSignIn();
                          signIn.signOut();
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        child: Text(
                          "Logout",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      Spacer(),
                    ],
                  );
                }
            }
          }),
    );
  }
}
