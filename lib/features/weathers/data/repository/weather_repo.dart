import 'package:azzam_weather_mobile/data_sources/ApiClient.dart';
import 'package:azzam_weather_mobile/features/weathers/data/data_sources/local/local_data.dart';
import 'package:azzam_weather_mobile/features/weathers/data/models/Weather.dart';

class WeatherRepository {

  Future<Weather> getRemoteWeatherData() async{

    Weather data= await ApiClient().getWeatherData();
    return data;
  }

  Future<Weather> getLocalWeatherData() async{

    Weather data= await LocalData().getWeatherFromLocalData();
    return data;
  }
}