import '../../../weathers/data/models/weather.dart';

class HourlyForecastWeather {

  List<Hourly> hourlyData= [];

  void setData(Weather data) {
    for(int i=0; i< data.days.length; i++) {
      Hourly briefData= Hourly();
      briefData.setData(data.days[0].hours[i]);
      hourlyData.add(briefData);
    }
  }

}

class Hourly {

  String? datetime;
  dynamic conditions;
  double? temp;

  void setData(HourlyData data) {
    datetime= data.datetime;
    conditions= data.conditions;
    temp= data.temp;
  }

}