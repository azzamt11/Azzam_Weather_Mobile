import 'package:azzam_weather_mobile/features/weathers/presentation/helpers/text_styles.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final int type;
  const TextWidget({super.key, required this.text, required this.type});

  @override
  Widget build(BuildContext context) {
    return Text(
      text, 
      style: TextStyles().getStyle(type),
      overflow: TextOverflow.ellipsis,
    );
  }
}