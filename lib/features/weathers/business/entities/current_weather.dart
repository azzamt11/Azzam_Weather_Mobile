import 'package:azzam_weather_mobile/features/weathers/data/models/weather.dart';
import 'package:flutter/material.dart';

class CurrentWeather {

  double? temp;
  String? conditions;
  double? visibility;
  double? uvIndex;
  double? humidity;
  double? windSpeed;
  double? pressure;
  String? address;

  bool isUpdated= false;

  String? message;

  void setData(HourlyData data, address) {
    temp= data.temp;
    conditions= data.conditions;
    visibility= data.visibility;
    uvIndex= data.uvIndex;
    humidity= data.humidity;
    windSpeed= data.windSpeed;
    pressure= data.pressure;
    address= address;

    debugPrint("temp is set to $temp");
  }

  void setIsUpdated(bool value) {
    isUpdated= value;
  } 

  void setMessage(String value) {
    message= value;
  }
}