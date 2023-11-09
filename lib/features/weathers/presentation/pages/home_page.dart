import 'package:azzam_weather_mobile/features/weathers/business/entities/interface_weather_data.dart';
import 'package:azzam_weather_mobile/features/weathers/presentation/widgets/header_widget.dart';
import 'package:azzam_weather_mobile/features/weathers/presentation/widgets/main_widget.dart';
import 'package:azzam_weather_mobile/features/weathers/presentation/widgets/panorama.dart';
import 'package:azzam_weather_mobile/features/weathers/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final InterfaceWeatherData data;
  const HomePage({super.key, required this.data});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController controller = ScrollController();

  double barPosition= 0;

  @override
  void initState() {
    controller.addListener(() {
      // always prints "scrolling = true"
      if(controller.position.pixels> 290 && barPosition== 0) {
        setState(() {
          barPosition= 50;
        });
      }

      if(controller.position.pixels< 290 && barPosition== 50) {
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
    return Scaffold(
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
            appBar(size)
          ],
        )
      ),
    );
  }

  Widget appBar(Size size) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: barPosition),
      duration: const Duration(milliseconds: 500),
      builder:(BuildContext context, double top, Widget? child) {
        return Positioned(
          top: top- 50,
          child: Container(
            height: 50,
            width: size.width,
            padding: const EdgeInsets.only(top: 10, left: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.grey),
              ),
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 140,
                  child: TextWidget(
                    text: widget.data.current.address??"Jakarta", 
                    type: 0
                  ),
                )
              ]
            )
          )
        );
      },
    );
  }

}