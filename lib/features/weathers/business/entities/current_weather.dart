import 'package:flutter/material.dart';

import '../../../weathers/data/models/weather.dart';

class CurrentWeather {
  double? temp;
  double? tempMin;
  double? tempMax;
  double? feelslike;
  String? conditions;
  double? visibility;
  double? uvIndex;
  double? humidity;
  double? windSpeed;
  double? pressure;
  String? address;
  double? moonphase;
  String? sunrise;
  String? sunset;

  bool isUpdated= false;

  String? message;

  void setData(HourlyData data, DailyData dailyData, address) {
    debugPrint("STEP B6: address= $address");
    temp= data.temp;
    conditions= data.conditions;
    visibility= data.visibility;
    uvIndex= data.uvIndex;
    humidity= data.humidity;
    windSpeed= data.windSpeed;
    pressure= data.pressure;
    tempMin= dailyData.tempMin;
    tempMax= dailyData.tempMax;
    feelslike= data.feelslike;
    this.address= address;
    sunset= dailyData.sunset;
    sunrise= dailyData.sunrise;
    moonphase= dailyData.moonphase;


    debugPrint("temp is set to $temp");
  }

  void setIsUpdated(bool value) {
    isUpdated= value;
  } 

  void setMessage(String value) {
    message= value;
  }
}