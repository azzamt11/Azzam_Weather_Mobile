import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../weathers/business/entities/interface_weather_data.dart';
import '../../../weathers/presentation/widgets/about_button.dart';
import '../../../weathers/presentation/widgets/header_widget.dart';
import '../../../weathers/presentation/widgets/main_widget.dart';
import '../../../weathers/presentation/widgets/panorama.dart';
import '../../../weathers/presentation/widgets/text_widget.dart';

class HomePage extends StatefulWidget {
  final InterfaceWeatherData data;
  final double topPadding;
  const HomePage({super.key, required this.data, required this.topPadding});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController controller = ScrollController();

  double barPosition= 0;
  int drawerIncrement= 0;
  double topPadding= 0;

  @override
  void initState() {
    setState(() {
      topPadding= widget.topPadding;
    });
    controller.addListener(() {
      // always prints "scrolling = true"
      if(controller.position.pixels> 290 && barPosition== 0) {
        setState(() {
          barPosition= 60+ widget.topPadding;
        });
      }

      if(controller.position.pixels< 290 && barPosition> 60) {
        setState(() {
          barPosition= 0;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async{
        exit(1);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: size.height,
          width: size.width,
          color: Colors.white,
          child: Stack(
            children: [
              Panorama(isDay: DateTime.now().hour< 18, data: widget.data),
              HeaderWidget(address: widget.data.current.address??"Jakarta, Indonesia"),
              MainWidget(controller: controller, data: widget.data),
              appBar(size, topPadding)
            ],
          )
        ),
      )
    );
  }

  Widget appBar(Size size, double topPadding) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: barPosition),
      duration: const Duration(milliseconds: 500),
      builder:(BuildContext context, double top, Widget? child) {
        return Positioned(
          top: top- 60- topPadding,
          child: Container(
            height: 60+ topPadding,
            width: size.width,
            padding: Constants().getDefaultPadding(size),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(width: 1.0, color: Color.fromRGBO(200, 200, 200, 0.8)),
              ),
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 140,
                  margin: EdgeInsets.only(top: 5+ topPadding),
                  child: TextWidget(
                    text: widget.data.current.address??"Jakarta", 
                    type: 0
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10+ topPadding),
                  child: const AboutButton()
                )
              ]
            )
          )
        );
      },
    );
  }

}