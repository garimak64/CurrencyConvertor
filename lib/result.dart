import 'package:currencyconvertor/exchange_api.dart';
import 'package:currencyconvertor/exchange_modal.dart';
import 'package:currencyconvertor/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Result extends StatelessWidget {


  Future<Exchange> getData(CurrencyConfig user) {
    return ExchangeApi().fetchExchange(user.baseCurrency);
  }

  @override
  Widget build(BuildContext context) {
    CurrencyConfig user = Provider.of<CurrencyConfig>(context);
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: FutureBuilder<Exchange>(
          future: getData(user),
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
                  List<String> compareCurrencyList = user.selectedCurrency.toList();
                 /* List<Widget> columnWidget = [];

                  columnWidget.addAll(compareCurrencyList
                      .map((e) => Text(
                            "Selected Currency: " +
                                e +
                                ": " +
                                snapshot.data.getExchangeRate(e).toString(),
                            style: TextStyle(color: Colors.white),
                          ))
                      .toList());*/
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 80,
                      ),
                      Text("SIVISOFT",
                          style: GoogleFonts.mcLaren(
                              textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          ))),
                      SizedBox(
                        height: 40,
                      ),
                      Text("CURRENCY CONVERTER",
                          style: GoogleFonts.mcLaren(
                              textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ))),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.refresh,
                            color: Colors.white,
                          ),
                          Text("Refresh",
                              style: GoogleFonts.mcLaren(
                                  textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ))),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Spacer(
                            flex: 2,
                          ),
                          Text(
                            user.baseCurrency + " Value: 1 " + user.baseCurrency,
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                          Spacer(
                            flex: 6,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Edit Base Currency",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )),
                          Spacer(
                            flex: 8,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              " Today's Value ",
                              style: TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              " + Add more Currency ",
                              style: TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          ),
                        ],
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: compareCurrencyList.length ,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(compareCurrencyList[index] + 
                            ": " +
                                snapshot.data.getExchangeRate(compareCurrencyList[index] ).toString(),
                              style: TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          );
                        },

                      )
                    ],
                  );
                }
            }
          }),
    );
  }
}

//,
//Spacer(),
//Text("CURRENCY CONVERTER",
//style: GoogleFonts.mcLaren(
//textStyle: TextStyle(
//color: Colors.white,
//fontSize: 28,
//))),
