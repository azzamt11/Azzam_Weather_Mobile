import 'package:azzam_weather_mobile/features/weathers/business/entities/current_weather.dart';
import 'package:azzam_weather_mobile/features/weathers/business/entities/daily_forecast_weather.dart';
import 'package:azzam_weather_mobile/features/weathers/business/entities/hourly_forecast_weather.dart';

class InterfaceWeatherData {

  CurrentWeather current= CurrentWeather();
  DailyForecastWeather daily= DailyForecastWeather();
  HourlyForecastWeather hourly= HourlyForecastWeather();

  InterfaceWeatherData(
    this.current,
    this.daily,
    this.hourly
  );

}