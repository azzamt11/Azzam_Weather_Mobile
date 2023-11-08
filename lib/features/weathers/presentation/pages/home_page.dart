import 'dart:developer';

import 'package:azzam_weather_mobile/features/weathers/business/entities/interface_weather_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final InterfaceWeatherData data;
  const HomePage({super.key, required this.data});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Column(
          children: [
            const Text("This is HomePage"),
            ElevatedButton(
              onPressed: () {
                //nothing
              },
              child: const Text('Refresh Weather'),
            ),
            Text("datetime data: ${widget.data.current.temp}")
          ],
        )
      ),
    );
  }
}