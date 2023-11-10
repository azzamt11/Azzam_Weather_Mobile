import '../../../../core/constants/constants.dart';

class Functions {

  String errorTranslator(int statusCode) {
    return Constants().errorCodes[statusCode]!;
  } 

  double fahrenheitToCelcius(double value) {
    double result= double.parse(((value- 32)*5/9).toStringAsFixed(1));
    return result;
  }

}