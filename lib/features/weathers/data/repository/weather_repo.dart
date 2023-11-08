import '../../data/data_sources/remote/api_client.dart';
import '../../data/data_sources/local/local_data.dart';
import '../../data/models/weather.dart';

class WeatherRepository {

  Future<Weather> getWeatherData() async{

    Weather data= await ApiClient().getWeatherData();
    return data;
  }

  Future<Weather> getLocalWeatherData() async{

    Weather data= await LocalData().getWeatherFromLocalData();
    return data;
  }
}