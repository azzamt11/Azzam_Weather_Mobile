import 'package:azzam_weather_mobile/core/constants/constants.dart';

class Functions {

  String errorTranslator(int statusCode) {
    return Strings().errorCodes[statusCode]!;
  } 
}