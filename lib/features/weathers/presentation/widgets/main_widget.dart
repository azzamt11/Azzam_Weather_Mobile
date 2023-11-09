import 'package:azzam_weather_mobile/features/weathers/business/entities/interface_weather_data.dart';
import 'package:azzam_weather_mobile/features/weathers/presentation/widgets/current_weather_widget.dart';
import 'package:azzam_weather_mobile/features/weathers/presentation/widgets/hourly_forecast_widget.dart';
import 'package:flutter/material.dart';

class MainWidget extends StatefulWidget {
  final ScrollController controller;
  final InterfaceWeatherData data;
  const MainWidget({super.key, required this.controller, required this.data});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Positioned(
      top: 0,
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          controller: widget.controller,
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              Container(
                height: 1000,
                width: size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0),
                      Color.fromRGBO(255, 255, 255, 0.7), 
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      Colors.white,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    CurrentWeatherWidget(data: widget.data.current),
                    HourlyForecastWidget(data: widget.data.hourly, currentData: widget.data.current),
                  ],
                )
              ),
            ],
          )
        )
      )
    );
  }

}