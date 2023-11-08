import '../../../../core/constants/constants.dart';

class Functions {

  String errorTranslator(int statusCode) {
    return Constants().errorCodes[statusCode]!;
  } 
}