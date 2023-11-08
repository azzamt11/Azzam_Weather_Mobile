import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../presentation/helpers/functions.dart';
import '../../../data/models/weather.dart';
import '../../../../../core/constants/constants.dart';
import 'package:http/http.dart' as http;


class ApiClient {

  Future<Weather> getWeatherData() async {
    Weather data= Weather();
    debugPrint("STEP 0 getWeatherData is in progress");
    try{
      var response = await http.get(
        Uri.parse(Constants().getEndpoint()),
        headers: {
          "Accept": "application/json",
          "Content-type": "application/json",
          "Access-Control-Allow-Origin": "*",
        },
      );
      debugPrint("STEP 1: uri = ${Constants().getEndpoint()}, got response= ${response.toString()}");
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