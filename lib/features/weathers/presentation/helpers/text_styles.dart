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