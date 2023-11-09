class Weather {

  int? queryCost;
  String? datetime;
  double? latitude;
  double? longitude;
  String? resolvedAddress;
  String? timeZone;
  double? tzOffset;
  String? description;
  HourlyData currentCondition= HourlyData();
  List<DailyData> days= [];

  String? error;
  String? netError;

  void setData(Map<String, dynamic> data) {
    queryCost= data["queryCost"];
    latitude= data["latitude"];
    longitude= data["longitude"];
    resolvedAddress= data["resolvedAddress"];
    tzOffset= data["tzoffset"];
    timeZone= data["timezone"];
    description= data["description"];

    currentCondition.setData(data["currentConditions"]);

    for(int i=0; i< data["days"].length; i++) {
      DailyData day= DailyData();
      day.setData(data["days"][i]);
      days.add(day);
    }
  }

  void setAddress(String address) {
    resolvedAddress= address;
  }

  void setError(String error) {
    this.error= error;
  }

  void setNetworkError(String netError) {
    this.netError= netError;
  }

  Map<String, dynamic> toJSON() {
    return {
      "queryCost": queryCost,
      "latitude": latitude,
      "longitude": longitude,
      "resolvedAddress": resolvedAddress,
      "timezone": timeZone,
      "tzoffset": tzOffset,
      "description": description,
      "days": List<Map<String, dynamic>>.generate(days.length, (index) => days[index].toJSON())
    };
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
  double? moonphase;
  int? sunriseEpoch;
  String? sunset;
  int? sunsetEpoch;
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
    moonphase= data["moonphase"];
    sunrise= data["sunrise"];
    sunset= data["sunset"];
    description= data["description"];

    for(int i=0; i< data["hours"].length; i++) {
      HourlyData hour= HourlyData();
      hour.setData(data["hours"][i]);
      hours.add(hour);
    }
  }

  Map<String, dynamic> toJSON() {
    return {
      "datetime": datetime,
      "datetimeEpoch": datetimeEpoch,
      "temp": temp,
      "tempmax": tempMax,
      "tempmin": tempMin,
      "humidity": humidity,
      "dew": dew,
      "precip": precip,
      "windspeed": windSpeed,
      "winddir": windDir,
      "pressure": pressure,
      "visibility": visibility,
      "uvIndex": uvIndex,
      "conditions": conditions,
      "preciptype": precipType,
      "description": description,
      "hours": List<Map<String, dynamic>>.generate(hours.length, (index) => hours[index].toJSON())
    };
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

  Map<String, dynamic> toJSON() {
    return {
      "datetime": datetime,
      "datetimeEpoch": datetimeEpoch,
      "temp": temp,
      "feelslike": feelslike,
      "humidity": humidity,
      "dew": dew,
      "precip": precip,
      "precipType": precipType,
      "windspeed": windSpeed,
      "winddir": windDir,
      "pressure": pressure,
      "visibility": visibility,
      "uvindex": uvIndex,
      "conditions": conditions
    };
  }

}