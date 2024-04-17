import 'dart:math';

import 'package:flutter/material.dart';

import '../../../weathers/business/entities/interface_weather_data.dart';
import '../../../weathers/presentation/widgets/text_widget.dart';

class Panorama extends StatefulWidget {
  final bool isDay;
  final InterfaceWeatherData data;
  const Panorama({super.key, required this.isDay, required this.data});

  @override
  State<Panorama> createState() => _PanoramaState();
}

class _PanoramaState extends State<Panorama> {
  double targetTop= 400;
  double targetOpacity= 0;

  @override
  void initState() {
    setState(() {
      targetTop= 100;
      targetOpacity= 1;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Container(
      height: 500,
      width: min(size.width, size.height*0.56),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: getSkyColors(),
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.repeated,
        ),
      ), 
      child: Stack(
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 400, end: targetTop),
            duration: const Duration(milliseconds: 2000),
            builder:(BuildContext context, double top, Widget? child) {
              return Positioned(
                  top: top,
                  left: min(size.width, size.height*0.56)/2+ 30,
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: getColors(),
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.4, 0.7],
                        tileMode: TileMode.repeated,
                      ),
                      borderRadius: BorderRadius.circular(50)
                    ),
                  )
                );
            },
          ),
          Positioned(
            top: 100,
            left: min(size.width, size.height*0.56)/2- 110,
            child: SizedBox(
              height: 80,
              width: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: getText()
              )
            )
          )
        ],
      )
    );
  }

  List<Widget> getText() {
    if(widget.isDay) {
      return [
        TextWidget(text: "Sunrise: ${widget.data.current.sunrise}", type: 4),
        const SizedBox(height: 10),
        TextWidget(text: "Sunset: ${widget.data.current.sunset}", type: 4)
      ];
    } else {
      return [TextWidget(text: "Moonphase: ${widget.data.current.moonphase}", type: 3),];
    }
  }

  List<Color> getColors() {
    if(widget.isDay) {
      return [Color.fromRGBO(237, 241, 182, 1), Colors.white];
    } else {
      return [Color.fromARGB(255, 188, 187, 187), Color.fromARGB(255, 122, 122, 122)];
    }
  }

  List<Color> getSkyColors() {
    if(widget.isDay) {
      return [Color.fromRGBO(106, 144, 226, 1), Color.fromRGBO(143, 171, 230, 1), Colors.white];
    } else {
      return [Color.fromRGBO(6, 6, 7, 1), Color.fromRGBO(27, 8, 100, 1), Color.fromRGBO(90, 63, 200, 1)];
    }
  }
}