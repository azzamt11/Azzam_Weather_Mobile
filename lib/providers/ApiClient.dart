import 'dart:convert';

import 'package:azzam_weather_mobile/functions/StringFunctions.dart';
import 'package:azzam_weather_mobile/models/Weather.dart';
import 'package:azzam_weather_mobile/constants/Strings.dart';
import 'package:http/http.dart' as http;


class ApiClient {

  Future<Weather> getWeatherData() async {
    Weather data= Weather();
    try{
      var response = await http.get(
        Uri.parse(Strings().getEndpoint()),
        headers: {
          "Accept": "application/json",
          "Content-type": "application/json",
          "Access-Control-Allow-Origin": "*",
        },
      );
      var statusCode= response.statusCode;
      if (statusCode==200) {
        var decodedResponse = json.decode(response.body);
        data.setData(decodedResponse);
      } else {
        data.setError(StringFunctions().errorTranslator(statusCode));
      }
    } catch(e) {
      data.setNetworkError(e.toString());
    }
    return data;
  }

  
}