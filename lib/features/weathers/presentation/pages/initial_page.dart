import 'dart:math';

import 'package:azzam_weather_mobile/features/weathers/business/entities/interface_weather_data.dart';
import 'package:azzam_weather_mobile/features/weathers/business/repository/interface_weather_repo.dart';
import 'package:azzam_weather_mobile/features/weathers/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';


class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  double targetOpacity= 0;
  double targetRelativeSize= 0;
  int defaultDuration= 1700;

  @override
  void initState() {
    // TODO: implement initState
    initiate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Scaffold(
      body: getBody(size),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget getBody(var size) {
    return Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromRGBO(31, 98, 239, 1), Color.fromRGBO(25, 212, 253, 1)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.4, 0.7],
          tileMode: TileMode.repeated,
        ),
      ),
      child: Center(
        child: logoWidget(size)
      )
    );
  }

  Widget logoWidget(var size) {
    double defaultSize= min(size.width, size.height);
    return Container(
      height: defaultSize,
      width: defaultSize,
      margin: const EdgeInsets.only(bottom: 50),
      child: Stack(
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: targetRelativeSize),
            duration: Duration(milliseconds: defaultDuration),
            builder:(BuildContext context, double relativeSize, Widget? child) {
              return Align(
                alignment: Alignment.center,
                child: Container(
                  height: 180+ (defaultSize- 180)*relativeSize,
                  width: 180+ (defaultSize- 180)*relativeSize,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/weather_logo_transparent.png")
                      )
                  ),
                ),
              );
            },
          ),
          TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: targetOpacity),
              duration: Duration(milliseconds: defaultDuration- 50),
              builder:(BuildContext context, double opacity, Widget? child) {
                return Container(
                    height: defaultSize,
                    width: defaultSize,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color.fromRGBO(31, 98, 239, 1-opacity), Color.fromRGBO(25, 212, 253, 1-opacity)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.4, 0.7],
                      ),
                    ),
                );
              },
          )
        ],
      )
    );
  }

  void animateLogo(String param) {
    switch(param) {
      case "in" : {
        setState(() {
          targetOpacity= 1;
        });
        break;
      }
      case "out" : {
        setState(() {
          targetRelativeSize = 1;
          targetOpacity= 0;
        });
        break;
      }
    }
  }

  Future<void> initiate() async{
    await Future.delayed(const Duration(seconds: 1));
    animateLogo("in");
    await Future.delayed(const Duration(milliseconds: 3000));
    setState(() {
      defaultDuration= 500;
    });
    InterfaceWeatherData data= await InterfaceWeatherRepository().getWeatherData();

    int increment= 0;
    while(!data.current.isUpdated && increment< 5) {
      Future.delayed(const Duration(seconds: 3));
      data= await InterfaceWeatherRepository().getWeatherData();
      increment++;
    }

    if(!data.current.isUpdated) {
      data= await InterfaceWeatherRepository().getCurrentWeatherDataFromLocal();
    }

    //.............................................

    //Just for mock. Since I cannot run this app in emulator, because it is too heavy for my computer,
    //I can only run it in browser. And since browsers have some kind of security mechanism prohibiting
    //my apiClient to retrieve the data from the Api, I have to mock the data in order to adjust the interface

    if(data.current.message!= null) {
      data= await InterfaceWeatherRepository().getMockWeatherData();
    }

    //..............................................
  
    Navigator.push(
      context, MaterialPageRoute(
        builder: (context)=> HomePage(data: data)
      )
    );
    animateLogo("out");
  }
}