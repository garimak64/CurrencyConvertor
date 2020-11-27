
import 'dart:convert';
import 'exchange_modal.dart';
import 'package:http/http.dart' as http;

class ExchangeApi {
  Future<Exchange> fetchExchange(String code) async{
    final response = await http.get('https://api.exchangeratesapi.io/latest?base=$code');
    if(response.statusCode == 200) {
      return Exchange.fromJson(json.decode(response.body));
    } else {
      return Exchange(error: "Something");
    } 
  }
}