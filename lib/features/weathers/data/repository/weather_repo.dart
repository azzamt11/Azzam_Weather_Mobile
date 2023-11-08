import 'package:azzam_weather_mobile/core/constants/mock.dart';
import 'package:flutter/material.dart';

import '../../data/data_sources/remote/api_client.dart';
import '../../data/data_sources/local/local_data.dart';
import '../../data/models/weather.dart';

class WeatherRepository {

  Future<Weather> getWeatherData() async{

    Weather data= await ApiClient().getWeatherData();
    return data;
  }

  Future<Weather> getLocalWeatherData() async{

    Weather data= await LocalData().getWeatherFromLocalData();
    return data;
  }

  Future<void> saveWeatherData(Weather data) async{
    LocalData().saveWeatherToLocalData(data);
  }

  Future<Weather> getMockWeather() async{

    Weather data= Mock().getData();
    debugPrint("STEP A1: data= ${data.currentCondition.datetime}");
    return data;
  }
}