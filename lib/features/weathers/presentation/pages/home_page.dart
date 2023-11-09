import 'package:azzam_weather_mobile/features/weathers/business/entities/interface_weather_data.dart';
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
            const Panorama(),
            headerWidget(size),
            mainWidget(size),
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
                    text: widget.data.current.address??"Bali", 
                    type: DateTime.now().hour> 18? 0 : 2
                  ),
                )
              ]
            )
          )
        );
      },
    );
  }

  Widget headerWidget(Size size) {
    return Positioned(
      top: 0,
      child: Container(
        height: 70,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 140,
              child: TextWidget(
                text: widget.data.current.address??"Bali", 
                type: DateTime.now().hour> 18? 0 : 2
              ),
            )
          ]
        )
      )
    );
  }

  Widget mainWidget(Size size) {
    return Positioned(
      top: 0,
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          controller: controller,
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
              ),
            ],
          )
        )
      )
    );
  }

}