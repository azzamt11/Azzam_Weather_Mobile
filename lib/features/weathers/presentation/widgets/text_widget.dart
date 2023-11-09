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
      textAlign: getTextAlign(type),
      maxLines: 2,
    );
  }

  TextAlign getTextAlign(int type) {
    switch(type) {
      case 7: return TextAlign.right;
      case 9: return TextAlign.center;
      default: return TextAlign.left;
    }
  }
}