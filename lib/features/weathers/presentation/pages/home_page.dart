import 'dart:developer';

import 'package:azzam_weather_mobile/features/weathers/business/entities/interface_weather_data.dart';
import 'package:azzam_weather_mobile/features/weathers/presentation/helpers/geolocation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final InterfaceWeatherData data;
  const HomePage({super.key, required this.data});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    locateMe();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Stack(
          children: [
            headerWidget(size)
          ],
        )
      ),
    );
  }

  Widget headerWidget(Size size) {
    return Positioned(
      top: 0,
      child: Container(
        height: 200,
        width: size.width,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 60,
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("")
                ]
              )
            )
          ],
        )
      )
    );
  }

  Future<void> locateMe() async{
    
    
  }
}