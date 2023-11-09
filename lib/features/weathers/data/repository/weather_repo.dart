import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/constants/mock.dart';
import 'geolocation.dart';
import '../../data/data_sources/remote/api_client.dart';
import '../../data/data_sources/local/local_data.dart';
import '../../data/models/weather.dart';

class WeatherRepository {

  Future<Weather> getWeatherData() async{

    Position? position= await Geolocation().getCurrentPosition();
    Weather data= await ApiClient().getWeatherData(position??Constants().defaultPosition);
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
    debugPrint("STEP B4: data.resolvedAddress= ${data.resolvedAddress}");
    return data;
  }
}