import 'package:azzam_weather_mobile/core/constants/constants.dart';
import 'package:azzam_weather_mobile/features/weathers/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String address;
  const HeaderWidget({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Positioned(
      top: 0,
      child: Container(
        height: 60,
        width: size.width,
        padding: Constants().getDefaultPadding(size),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 140,
              child: TextWidget(
                text: address??"Bali", 
                type: DateTime.now().hour< 18? 0 : 2
              ),
            )
          ]
        )
      )
    );
  }

}