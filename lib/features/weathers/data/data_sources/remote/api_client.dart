import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../../presentation/helpers/functions.dart';
import '../../../data/models/weather.dart';
import '../../../../../core/constants/constants.dart';
import 'package:http/http.dart' as http;


class ApiClient {

  Future<Weather> getWeatherData(Position position) async {
    Weather data= Weather();
    debugPrint("STEP 0 getWeatherData is in progress");
    var response = await http.get(
        Uri.parse(Constants().getEndpoint(position.latitude, position.longitude)),
        headers: {
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
          'Accept': '*/*'
        },
      );
      var statusCode= response.statusCode;
      if (statusCode==200) {
        var decodedResponse = json.decode(response.body);
        data.setData(decodedResponse);
      } else {
        data.setError(Functions().errorTranslator(statusCode));
      }
    try{
      
    } catch(e) {
      data.setNetworkError(e.toString());
    }
    return data;
  }

  
}