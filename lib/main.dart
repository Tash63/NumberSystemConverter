import 'package:flutter/material.dart';
import 'package:numberconverter/Calculator.dart';


import 'package:numberconverter/ConvertPage.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/Convert',
    routes: {
      '/Convert': (context)=> HomePage(),
      '/Calculate':(context)=>Calcultor(),
    },
  debugShowCheckedModeBanner: false,));
}





