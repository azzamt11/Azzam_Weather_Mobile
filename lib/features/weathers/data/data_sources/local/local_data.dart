import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/weather.dart';

class LocalData {

  Future<Weather> getWeatherFromLocalData() async{
    Map<String, dynamic> rawData;
    Weather data= Weather();
    String? dataString= await getString("user", "data");
    if(dataString!= null) {
      rawData= json.decode(dataString);
      data.setData(rawData);
    } else {
      data.setError("Data tidak ditemukan");
    }
    return data;
  }

  Future<void> saveWeatherToLocalData(Weather data) async{
    Map<String, dynamic> rawData= data.toJSON();
    String dataString= json.encode(rawData);
    await saveString("user", "data", dataString);
  }

  String _generateKey(String userId, String key) {
    return '$userId/$key';
  }

  Future<void> saveString(String userId, String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_generateKey(userId, key), value);
  }

  Future<String?> getString(String userId, String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_generateKey(userId, key));
  }
}