import '../../../weathers/business/entities/daily_forecast_weather.dart';
import '../../../weathers/business/entities/hourly_forecast_weather.dart';
import '../../../weathers/business/entities/interface_weather_data.dart';
import '../../../weathers/data/models/weather.dart';
import '../../../weathers/data/repository/weather_repo.dart';
import '../../business/entities/current_weather.dart';

class InterfaceWeatherRepository {

  //try fetching data from network to get most updated weather data
  Future<InterfaceWeatherData> getWeatherData() async{
    Weather data= await WeatherRepository().getWeatherData();
    CurrentWeather currentData= CurrentWeather();
    DailyForecastWeather dailyForecastData= DailyForecastWeather();
    HourlyForecastWeather hourlyForecastData= HourlyForecastWeather();
    if(data.error==null && data.netError==null) {
      currentData.setData(
        data.currentCondition,
        data.days[0], 
        data.resolvedAddress,
      );
      dailyForecastData.setData(data);
      hourlyForecastData.setData(data);
      currentData.setIsUpdated(true);

      //saving the data for offline case
      WeatherRepository().saveWeatherData(data);

    } else {
      currentData.setIsUpdated(false);
      currentData.setMessage(data.error??data.netError??"Tidak dapat memuat data");
    }
    return InterfaceWeatherData(currentData, dailyForecastData, hourlyForecastData);
  }

  //for unsucessfull fetching data, now data can be retrieved from local
  Future<InterfaceWeatherData> getCurrentWeatherDataFromLocal() async{
    Weather data= await WeatherRepository().getLocalWeatherData();
    CurrentWeather currentData= CurrentWeather();
    DailyForecastWeather dailyForecastData= DailyForecastWeather();
    HourlyForecastWeather hourlyForecastData= HourlyForecastWeather();
    if(data.error==null && data.netError==null) {
      currentData.setData(
        data.days[0].hours[DateTime.now().hour], 
        data.days[0], 
        data.resolvedAddress,
      );
      dailyForecastData.setData(data);
      hourlyForecastData.setData(data);
    } else {
      currentData.setMessage(data.error??data.netError??"Data tidak ditemukan");
    }
    return InterfaceWeatherData(currentData, dailyForecastData, hourlyForecastData);
  }

  //just in case my application error, for at least there is something to show, we generate the mock data for weather

  /*
  Future<InterfaceWeatherData> getMockWeatherData() async{
    Weather data= await WeatherRepository().getMockWeather();
    CurrentWeather currentData= CurrentWeather();
    DailyForecastWeather dailyForecastData= DailyForecastWeather();
    HourlyForecastWeather hourlyForecastData= HourlyForecastWeather();
    if(data.error==null && data.netError==null) {
      debugPrint("STEP B5: data.address= ${data.resolvedAddress}");
      currentData.setData(
        data.currentCondition,
        data.days[0], 
        data.resolvedAddress,
      );
      dailyForecastData.setData(data);
      hourlyForecastData.setData(data);
    } else {
      currentData.setMessage(data.error??data.netError??"Data tidak ditemukan");
    }
    return InterfaceWeatherData(currentData, dailyForecastData, hourlyForecastData);
  }
  */

}