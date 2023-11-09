import 'package:azzam_weather_mobile/features/weathers/presentation/pages/about_page.dart';
import 'package:flutter/material.dart';

class AboutButton extends StatelessWidget {
  const AboutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
        Navigator.push(
          context, MaterialPageRoute(
            builder: (context)=> const AboutPage()
          )
        );
      },
      splashColor: Colors.black12,
      child: Container(
        height: 30,
        width: 24,
        color: Colors.transparent,
        child: const Center(
          child: Icon(Icons.info_rounded, color: Colors.grey, size: 26)
        )
      )
    );
  }

}