//import 'package:flutter/material.dart';
//
//import 'converter_screen.dart';
//
//class ExchangeView extends StatefulWidget {
//
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return _ExchangeViewState();
//  }
//}
//
//class _ExchangeViewState extends State<ExchangeView> {
//  TextEditingController _fromController;
//  TextEditingController _toController;
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    _fromController = TextEditingController();
//    _toController = TextEditingController();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//        body: SafeArea(
//          child: Stack(
//            children: [
//              Positioned(
//                top: 50,
//                child: ConverterView(fromController: _fromController, toController: _toController,),
//              ),
//
//            ],
//          ),
//        )
//    );
//  }
//}