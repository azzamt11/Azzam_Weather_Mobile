import 'package:azzam_weather_mobile/features/weathers/data/models/weather.dart';

class CurrentWeather {

  double? temp;
  String? conditions;
  double? visibility;
  double? uvIndex;
  double? humidity;
  double? windSpeed;
  double? pressure;

  bool isUpdated= false;

  String? message;

  void setData(HourlyData data) {
    temp= data.temp;
    conditions= data.conditions;
    visibility= data.visibility;
    uvIndex= data.uvIndex;
    humidity= data.humidity;
    windSpeed= data.windSpeed;
    pressure= data.pressure;
  }

  void setIsUpdated(bool value) {
    isUpdated= value;
  } 

  void setMessage(String value) {
    message= value;
  }
}