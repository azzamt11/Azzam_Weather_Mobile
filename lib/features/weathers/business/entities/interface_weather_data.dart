import '../../../weathers/business/entities/current_weather.dart';
import '../../../weathers/business/entities/daily_forecast_weather.dart';
import '../../../weathers/business/entities/hourly_forecast_weather.dart';

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