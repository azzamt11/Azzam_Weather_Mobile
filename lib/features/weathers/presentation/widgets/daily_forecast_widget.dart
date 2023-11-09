import 'package:azzam_weather_mobile/core/constants/constants.dart';
import 'package:azzam_weather_mobile/features/weathers/business/entities/current_weather.dart';
import 'package:azzam_weather_mobile/features/weathers/business/entities/daily_forecast_weather.dart';
import 'package:azzam_weather_mobile/features/weathers/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyForecastWidget extends StatelessWidget {
  final DailyForecastWeather data;
  final CurrentWeather currentData;
  const DailyForecastWidget({super.key, required this.data, required this.currentData});

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Container(
      height: 195+ 37,
      width: size.width,
      margin: Constants().getDefaultPadding(size),
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          header(size),
          slider(size)
        ],
      )
    );
  }

  Widget header(var size) {
    return SizedBox(
      height: 37,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(text: "Daily Forecast up to ${data.dailyData.length-1} days", type: 8),
        ],
      )

    );
  }
  
  Widget slider(var size) {
    return SizedBox(
      height: 165,
      width: size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: getDailyList(),
        )
      )
    );
  }

  List<Widget> getDailyList() {
    List<Widget> dailyList= [];
    for(int i=0; i< data.dailyData.length; i++) {
      List<String> datetime= data.dailyData[i].datetime.toString().split("-");
      dailyList.add(
        Container(
          height: 165,
          width: 60,
          decoration: BoxDecoration(
            border: Border(
              left: i!=0
              ? const BorderSide(width: 1, color: Color.fromRGBO(200, 200, 200, 0.6)) 
              : const BorderSide(width: 0, color: Colors.transparent),
            )
          ),
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextWidget(
                text: "${getMonth(int.parse(datetime[1]))} ${datetime[2]}th", 
                type: 10
              ),
              Container(
                height: 20,
                width: 23,
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(getImageString(data.dailyData[i].conditions))
                  )
                ),
              ),
              const TextWidget(text: "Max.", type: 11),
              TextWidget(text: "${data.dailyData[i].tempMax}°C", type: 11),
              const SizedBox(height: 7),
              const TextWidget(text: "Min.", type: 12),
              TextWidget(text: "${data.dailyData[i].tempMin}°C", type: 12)
            ],
          )
        )
      );
    }
    return dailyList;
  }

  String getMonth(int index) {
    return Constants().months[index-1];
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