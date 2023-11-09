import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../weathers/business/entities/current_weather.dart';
import '../../../weathers/presentation/helpers/functions.dart';
import '../../../weathers/presentation/widgets/text_widget.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final CurrentWeather data;
  const CurrentWeatherWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Container(
      height: 105,
      width: size.width,
      margin: const EdgeInsets.only(top: 130),
      padding: Constants().getDefaultPadding(size),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: Functions().fahrenheitToCelcius(data.temp??0).floor().toString(), type: 5),
                const TextWidget(text: "°C", type: 6)
              ],
            )
          ),
          Container(
            width: min(size.width*(0.42), 250)- 5,
            padding: const EdgeInsets.only(top: 15),
            child: Align(
              alignment: Alignment.topRight,
              child: TextWidget(text: data.conditions.toString(), type: 7)
            )
          ),
        ]
      )
    );
  }
}