import 'package:azzam_weather_mobile/core/constants/constants.dart';
import 'package:azzam_weather_mobile/features/weathers/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 35),
              const TextWidget(text: "About This App", type: 7),
              const SizedBox(height: 100),
              const TextWidget(text: "Developer: Abdullah Azzam", type: 0),
              const TextWidget(text: "Framework: Flutter", type: 0),
              const SizedBox(height: 20),
              Container(
                width: size.width,
                margin: Constants().getDefaultPadding(size),
                child: const TextWidget(
                  text: "Features of applications: \n 1. Current Weather (with offline mode taking data from the previous forecast). \n 2. Daily and Hourly forecast weather. \n 3. The sunrise and sunset display (at day) and moonphase display (at night).", 
                  type: 14
                )
              ),
              const SizedBox(height: 20),
              Container(
                width: size.width,
                margin: Constants().getDefaultPadding(size),
                child: const TextWidget(
                  text: "I am gonna implement refresh feature in the next version, but currently, for the seek of submitting this project as soon as possible, you can refresh the app by exiting from it first. Thank you. 🙏", 
                  type: 14
                )
              ),
              const SizedBox(height: 20),
              backButton(size)
            ],
          )
        )
      )
    );
  }

  Widget backButton(var size) {
    return SizedBox(
      height: 40,
      width: size.width,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Material(
          child: InkWell(
            onTap: () async{
              Navigator.of(context).pop();
            },
            splashColor: Colors.black12,
            child: Container(
              color: Colors.transparent,
              height: 30,
              width: 200,
              child: const Center(
                child: TextWidget(text: "< Back to App", type: 13)
              )
            )
          ),
        )
      )
    );
  }

}