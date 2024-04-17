import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../features/weathers/presentation/pages/initial_page.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //Directory appDocsDir = await getApplicationDocumentsDirectory();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    double defaultWidth= min(size.width, size.height*0.56);
    return getFrame(size, defaultWidth);
  }

  Widget getFrame(var size, double defaultWidth) {
    return Container(
      height: size.height,
      width: size.width,
      color: Colors.black87,
      child: Center(
        child: SizedBox(
          height: size.height,
          width: defaultWidth,
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: InitialPage(),
          )
        )
      )
    );
  }
}