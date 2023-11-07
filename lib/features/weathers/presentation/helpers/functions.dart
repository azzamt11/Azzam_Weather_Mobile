import 'package:azzam_weather_mobile/core/constants/constants.dart';

class StringFunctions {

  String errorTranslator(int statusCode) {
    return Strings().errorCodes[statusCode]!;
  } 
}