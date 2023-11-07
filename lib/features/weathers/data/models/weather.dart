class Weather {

  int? queryCost;
  double? latitude;
  double? longitude;
  String? resolveAddress;
  String? timeZone;
  double? tzOffset;
  String? description;
  List<DailyData> days= [];

  String? error;
  String? netError;

  void setData(Map<String, dynamic> data) {
    queryCost= data["queryCost"];
    latitude= data["latitude"];
    longitude= data["longitude"];
    resolveAddress= data["resolveAddress"];
    tzOffset= data["tzoffset"];
    timeZone= data["timezone"];
    description= data["description"];

    for(int i=0; i< data["days"].length; i++) {
      DailyData day= DailyData();
      day.setData(data["days"][i]);
      days.add(day);
    }
  }

  void setError(String error) {
    this.error= error;
  }

  void setNetworkError(String netError) {
    this.netError= netError;
  }

}


class DailyData {

  String? datetime;
  int? datetimeEpoch;
  double? tempMax;
  double? tempMin;
  double? temp;
  double? dew;
  double? humidity;
  double? precip;
  dynamic precipType;
  double? windSpeed;
  double? windDir;
  double? pressure;
  double? visibility;
  double? uvIndex;
  String? conditions;
  String? sunrise;
  int? sunriseEpoch;
  String? sunset;
  int? subsetEpoch;
  String? description;

  List<HourlyData> hours= [];

  void setData(Map<String, dynamic> data) {
    datetime= data["datetime"];
    datetimeEpoch= data["datetimeEpoch"];
    temp= data["temp"];
    tempMax= data["tempmax"];
    tempMin= data["tempmin"];
    humidity= data["humidity"];
    dew= data["dew"];
    precip= data["precip"];
    windSpeed= data["windspeed"];
    windDir= data["winddir"];
    pressure= data["pressure"];
    visibility= data["visibility"];
    uvIndex= data["uvindex"];
    conditions= data["conditions"];
    precipType= data["preciptype"];
    description= data["description"];

    for(int i=0; i< data["hours"].length; i++) {
      HourlyData hour= HourlyData();
      hour.setData(data["hours"][i]);
      hours.add(hour);
    }
  }

}


class HourlyData {

  String? datetime;
  int? datetimeEpoch;
  double? temp;
  double? feelslike;
  double? humidity;
  double? dew;
  double? precip;
  dynamic precipType;
  double? windSpeed;
  double? windDir;
  double? pressure;
  double? visibility;
  double? uvIndex;
  String? conditions;

  void setData(Map<String, dynamic> data) {
    datetime= data["datetime"];
    datetimeEpoch= data["datetimeEpoch"];
    temp= data["temp"];
    feelslike= data["feelslike"];
    humidity= data["humidity"];
    dew= data["dew"];
    precip= data["precip"];
    precipType= data["preciptype"];
    windSpeed= data["windspeed"];
    windDir= data["winddir"];
    pressure= data["pressure"];
    visibility= data["visibility"];
    uvIndex= data["uvindex"];
    conditions= data["conditions"];
  }

}