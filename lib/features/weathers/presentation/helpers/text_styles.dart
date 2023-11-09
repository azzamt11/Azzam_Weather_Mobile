import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TextStyles {

  TextStyle getStyle(int type) {
    Color color= Colors.black;
    double fontSize= 14;
    FontWeight fontWeight= FontWeight.normal;
    TextDecoration? textDecoration;
    switch(type) {
      case 1: {
        color= Colors.white;
        fontSize= 13.5;
      }
      case 2: {
        color= Colors.white;
        fontSize= 14;
      }
      case 3: {
        color= const Color.fromRGBO(255, 255, 255, 0.3);
        fontSize= 11;
        fontWeight= FontWeight.normal;
      }
      case 4: {
        color= const Color.fromRGBO(255, 255, 255, 0.6);
        fontSize= 11;
        fontWeight= FontWeight.normal;
      }
    }
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        decoration: textDecoration,
        decorationThickness: 1.7
      )
    );
  }
}