import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TextStyles {

  TextStyle getStyle(int type) {
    Color color= Colors.black;
    double fontSize= 16;
    FontWeight fontWeight= FontWeight.normal;
    TextDecoration? textDecoration;
    switch(type) {
      case 1: {
        color= Colors.white;
        fontSize= 14;
      }
      case 2: {
        color= Colors.white;
      }
      case 3: {
        color= const Color.fromRGBO(255, 255, 255, 0.3);
        fontSize= 13.5;
        fontWeight= FontWeight.normal;
      }
      case 4: {
        color= const Color.fromRGBO(255, 255, 255, 0.6);
        fontSize= 13.5;
        fontWeight= FontWeight.normal;
      }
      case 5: {
        fontSize= 75;
      }
      case 6: {
        fontSize= 70;
        color= Colors.grey;
      }
      case 7: {
        fontSize= 20;
      }
      case 8: {
        fontSize= 13.8;
        fontWeight= FontWeight.bold;
      }
      case 9: {
        fontSize= 11.3;
        color= Colors.grey;
        fontWeight= FontWeight.bold;
      }
      case 10: {
        fontSize= 12.7;
      }
      case 11: {
        fontSize= 11.8;
        color= Colors.red;
      }
      case 12: {
        fontSize= 11.8;
        color= Colors.blue;
      }
      case 13: {
        fontSize= 13.5;
        fontWeight= FontWeight.bold;
        color= const Color.fromARGB(255, 1, 87, 155);
      }
    }
    return GoogleFonts.dosis(
      textStyle: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        decoration: textDecoration,
        decorationThickness: 1.2,
      )
    );
  }
}