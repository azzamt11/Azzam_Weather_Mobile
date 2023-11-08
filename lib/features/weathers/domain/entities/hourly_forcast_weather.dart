import 'package:azzam_weather_mobile/features/weathers/data/models/weather.dart';

class HourlyForecastWeather {

  List<Hourly> dailyData= [];

  void setData(Weather data) {
    for(int i=0; i< data.days.length; i++) {
      Hourly briefData= Hourly();
      briefData.setData(data.days[i]);
      dailyData.add(briefData);
    }
  }

}

class Hourly {

  String? datetime;
  dynamic conditions;
  double? temp;

  void setData(DailyData data) {
    datetime= data.datetime;
    conditions= data.conditions;
    temp= data.temp;
  }

}