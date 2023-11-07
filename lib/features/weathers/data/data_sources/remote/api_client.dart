import 'dart:convert';

import 'package:azzam_weather_mobile/features/weathers/presentation/helpers/functions.dart';
import 'package:azzam_weather_mobile/features/weathers/data/models/weather.dart';
import 'package:azzam_weather_mobile/core/constants/constants.dart';
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
        data.setError(Functions().errorTranslator(statusCode));
      }
    } catch(e) {
      data.setNetworkError(e.toString());
    }
    return data;
  }

  
}