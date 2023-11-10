import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../weathers/business/entities/current_weather.dart';
import '../../../weathers/presentation/widgets/text_widget.dart';
import '../../../weathers/presentation/helpers/functions.dart';


class WeatherFeatures extends StatefulWidget {
  final CurrentWeather data;
  const WeatherFeatures({super.key, required this.data});

  @override
  State<WeatherFeatures> createState() => _WeatherFeaturesState();
}

class _WeatherFeaturesState extends State<WeatherFeatures> {
  List<List<String>> features= [];

  @override
  void initState() {
    features= [
      ["Feelslike", "${Functions().fahrenheitToCelcius(widget.data.feelslike??0)}°C", "images/feelslike.png"],
      ["Visibility", "${widget.data.visibility} km", "images/visibility.png"],
      ["UV Index", widget.data.uvIndex.toString(), "images/uvindex.png"],
      ["Humidity", "${widget.data.humidity} %", "images/humidity.png"],
      ["Wind Speed", "${widget.data.windSpeed} km/h", "images/windspeed.png"],
      ["Air Pressure", "${widget.data.pressure} hPa", "images/airpressure.png"]
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Container(
      height: 375,
      width: size.width,
      margin: Constants().getDefaultPadding(size),
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          header(size),
          featureGrid(size),
          link(size)
        ],
      )
    );
  }

  Widget header(var size) {
    return SizedBox(
      height: 20,
      width: size.width,
      child: const Align(
        alignment: Alignment.topCenter,
        child: TextWidget(text: "Features", type: 8),
      )
    );
  }

  Widget featureGrid(var size) {
    return SizedBox(
      height: 250,
      width: size.width,
      child: Column(
        children: [
          featureRow(size, 0),
          featureRow(size, 1)
        ],
      )
    );
  }

  Widget featureRow(var size, int index) {
    return SizedBox(
      height: 125,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: getFeatures(index),
      )
    );
  }

  List<Widget> getFeatures(int index) {
    List<Widget> featureWidget= [];
    if(features.isNotEmpty) {
      for(int i= index*3; i< 3+ index*3; i++) {
        featureWidget.add(
          SizedBox(
            height: 125,
            width: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(features[i][2])
                    )
                  ),
                ),
                const SizedBox(height: 10),
                TextWidget(text: features[i][1], type: 10),
                const SizedBox(height: 3),
                TextWidget(text: features[i][0], type: 9)
              ],
            )
          )
        );
      }
    }

    return featureWidget;
  }

  Widget link(var size) {
    return SizedBox(
      height: 40,
      width: size.width,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Material(
          child: InkWell(
            onTap: () async{
              await launchUrlFunction("https://www.visualcrossing.com/weather-api");
            },
            splashColor: Colors.black12,
            child: Container(
              color: Colors.transparent,
              height: 30,
              width: 200,
              child: const Center(
                child: TextWidget(text: "Visit API Website >", type: 13)
              )
            )
          ),
        )
      )
    );
  }

  Future<void> launchUrlFunction(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}