import 'package:azzam_weather_mobile/features/weathers/data/models/weather.dart';
import 'package:azzam_weather_mobile/features/weathers/data/repository/weather_repo.dart';
import 'package:azzam_weather_mobile/features/weathers/domain/entities/daily_forecast_weather.dart';
import 'package:azzam_weather_mobile/features/weathers/domain/entities/hourly_forcast_weather.dart';

import '../../../weathers/domain/entities/current_weather.dart';

class CurrentWeatherRepository {

  //try fetching data from network to get most updated weather data
  Future<CurrentWeather> getCurrentWeatherData() async{
    Weather data= await WeatherRepository().getWeatherData();
    CurrentWeather currentData= CurrentWeather();
    DailyForecastWeather dailyForecastData= DailyForecastWeather();
    HourlyForecastWeather hourlyForecastData= HourlyForecastWeather();
    if(data.error==null && data.netError==null) {
      currentData.setData(data.currentCondition);
      dailyForecastData.setData(data);
      hourlyForecastData.setData(data);
      currentData.setIsUpdated(true);

      //saving the data for offline case
      WeatherRepository().saveWeatherData(data);

    } else {
      currentData.setIsUpdated(false);
      currentData.setMessage(data.error??data.netError??"Tidak dapat memuat data");
    }
    return currentData;
  }

  //for unsucessfull fetching data, now data can be retrieved from local
  Future<CurrentWeather> getCurrentWeatherDataFromLocal() async{
    Weather data= await WeatherRepository().getLocalWeatherData();
    CurrentWeather currentData= CurrentWeather();
    DailyForecastWeather dailyForecastData= DailyForecastWeather();
    HourlyForecastWeather hourlyForecastData= HourlyForecastWeather();
    if(data.error==null && data.netError==null) {
      currentData.setData(data.currentCondition);
      dailyForecastData.setData(data);
      hourlyForecastData.setData(data);
    } else {
      currentData.setMessage(data.error??data.netError??"Data tidak ditemukan");
    }
    return currentData;
  }

}