import 'package:flutter/material.dart';

class Panorama extends StatefulWidget {
  const Panorama({super.key});

  @override
  State<Panorama> createState() => _PanoramaState();
}

class _PanoramaState extends State<Panorama> {
  double targetTop= 400;

  @override
  void initState() {
    setState(() {
      targetTop= 100;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Container(
      height: 500,
      width: size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: getSkyColors(),
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.repeated,
        ),
      ), 
      child: Stack(
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 400, end: targetTop),
            duration: const Duration(milliseconds: 2000),
            builder:(BuildContext context, double top, Widget? child) {
              return Positioned(
                  top: top,
                  left: size.width/2+ 50,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: getColors(),
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.4, 0.7],
                        tileMode: TileMode.repeated,
                      ),
                      borderRadius: BorderRadius.circular(50)
                    ),
                  )
                );
            },
          ),
        ],
      )
    );
  }

  List<Color> getColors() {
    if(DateTime.now().hour> 18) {
      return [Color.fromRGBO(237, 241, 182, 1), Colors.white];
    } else {
      return [Color.fromARGB(255, 188, 187, 187), Color.fromARGB(255, 122, 122, 122)];
    }
  }

  List<Color> getSkyColors() {
    if(DateTime.now().hour> 18) {
      return [Color.fromRGBO(106, 144, 226, 1), Color.fromRGBO(143, 171, 230, 1), Colors.white];
    } else {
      return [Color.fromRGBO(6, 6, 7, 1), Color.fromRGBO(27, 8, 100, 1), Color.fromRGBO(90, 63, 200, 1)];
    }
  }
}