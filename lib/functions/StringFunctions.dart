import 'package:azzam_weather_mobile/constants/Strings.dart';

class StringFunctions {

  String errorTranslator(int statusCode) {
    return Strings().errorCodes[statusCode]!;
  } 
}