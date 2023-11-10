import 'package:azzam_weather_mobile/core/constants/geolocation_data.dart';
import 'package:geolocator/geolocator.dart';

import '../../../weathers/data/repository/helper.dart';
import '../../../../core/constants/constants.dart';
import '../../data/repository/geolocation.dart';
import '../../data/data_sources/remote/api_client.dart';
import '../../data/data_sources/local/local_data.dart';
import '../../data/models/weather.dart';

class WeatherRepository {

  Future<Weather> getWeatherData() async{

    Position? position= await Geolocation().getCurrentPosition();
    Weather data= await ApiClient().getWeatherData(position??Constants().defaultPosition);

    try{
      List<String> resolved= data.resolvedAddress!.split(",");
      if(Helper().isNumeric(resolved[0])) {
        String address= "Jakarta";
        if(position!= null) {
          address= GeolocationData().getAddress(double.parse(resolved[0]), double.parse(resolved[1]));
        }

        data.setAddress(address);
      }
    } catch(e) {
      data.setAddress("Lat.${position!.latitude}, Long.${position.longitude}");
    }

    return data;
  }

  Future<Weather> getLocalWeatherData() async{

    Weather data= await LocalData().getWeatherFromLocalData();
    return data;
  }

  Future<void> saveWeatherData(Weather data) async{
    LocalData().saveWeatherToLocalData(data);
  }

  /*
  Future<Weather> getMockWeather() async{

    Weather data= Mock().getData();
    List<String> resolved= data.resolvedAddress!.split(",");
    if(Helper().isNumeric(resolved[0])) {
      String address= "Jakarta";
      address= GeolocationData().getAddress(double.parse(resolved[0]), double.parse(resolved[1]));

      debugPrint("STEP B8: address from getAddress= $address");

      data.setAddress(address);
    }
    debugPrint("STEP B4: data.resolvedAddress= ${data.resolvedAddress}");
    return data;
  }
  */

}