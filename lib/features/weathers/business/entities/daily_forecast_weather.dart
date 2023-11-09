import '../../../weathers/data/models/weather.dart';

class DailyForecastWeather {

  List<Daily> dailyData= [];

  void setData(Weather data) {
    for(int i=0; i< data.days.length; i++) {
      Daily briefData= Daily();
      briefData.setData(data.days[i]);
      dailyData.add(briefData);
    }
  }

}

class Daily {

  String? datetime;
  dynamic conditions;
  double? temp;
  double? tempMax;
  double? tempMin;

  void setData(DailyData data) {
    datetime= data.datetime;
    conditions= data.conditions;
    temp= data.temp;
    tempMax= data.tempMax;
    tempMin= data.tempMin;
  }

}