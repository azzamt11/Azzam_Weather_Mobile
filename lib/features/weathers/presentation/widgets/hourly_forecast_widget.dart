import 'dart:math';

import 'package:azzam_weather_mobile/core/constants/constants.dart';
import 'package:azzam_weather_mobile/features/weathers/business/entities/current_weather.dart';
import 'package:azzam_weather_mobile/features/weathers/business/entities/hourly_forecast_weather.dart';
import 'package:azzam_weather_mobile/features/weathers/data/models/weather.dart';
import 'package:azzam_weather_mobile/features/weathers/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HourlyForecastWidget extends StatelessWidget {
  final HourlyForecastWeather data;
  final CurrentWeather currentData;
  const HourlyForecastWidget({super.key, required this.data, required this.currentData});

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Container(
      height: 150,
      width: size.width,
      margin: Constants().getDefaultPadding(size),
      child: Column(
        children: [
          header(size),
          slider(size)
        ],
      )
    );
  }

  Widget header(var size) {
    DateTime now= DateTime.now();
    return SizedBox(
      height: 35,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextWidget(text: "Today ${now.day}/${now.month}/${now.year}", type: 8),
          TextWidget(text: "${currentData.tempMin}°C / ${currentData.tempMax}°C", type: 8),
        ],
      )

    );
  }
  
  Widget slider(var size) {
    return SizedBox(
      height: 115,
      width: size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: getHourlyList(),
        )
      )
    );
  }

  List<Widget> getHourlyList() {
    List<Widget> hourlyList= [];
    for(int i=0; i< data.hourlyData.length; i++) {
      hourlyList.add(
        Container(
          height: 110,
          width: 60,
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextWidget(text: data.hourlyData[i].datetime.toString().split(":")[0], type: 9),
              Container(
                height: 20,
                width: 23,
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(getImageString(data.hourlyData[i].conditions))
                  )
                ),
              ),
              Text(
                data.hourlyData[i].conditions,
                style: GoogleFonts.dosis(
                  textStyle: const TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                    decorationThickness: 1.2,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(height: 7),
              TextWidget(text: "${data.hourlyData[i].temp}°C", type: 9)
            ],
          )
        )
      );
      if(i< 24) {
        hourlyList.add(const SizedBox(width: 5));
      }
    }
    return hourlyList;
  }

  String getImageString(String condition) {
    if(condition.toLowerCase().contains("rain")) {
      return "images/rainy.png";
    } else if(condition.toLowerCase().contains("cloud")) {
      return "images/cloudy.png";
    } else if(condition.toLowerCase().contains("ovarcast")) {
      return "images/overcast.png";
    } else if(condition.toLowerCase().contains("storm")) {
      return "images/thunderstorm.png";
    } else {
      return "images/sun.png";
    }
  } 
}