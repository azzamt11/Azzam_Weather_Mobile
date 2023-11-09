import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../weathers/presentation/widgets/text_widget.dart';

class HeaderWidget extends StatelessWidget {
  final String address;
  const HeaderWidget({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    var topPadding= MediaQuery.of(context).padding.top;
    return Positioned(
      top: 0,
      child: Container(
        height: 60+ topPadding,
        width: size.width,
        padding: Constants().getDefaultPadding(size),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 140,
              margin: EdgeInsets.only(top: topPadding),
              child: TextWidget(
                text: address??"Jakarta", 
                type: DateTime.now().hour< 18? 0 : 2
              ),
            ),
          ]
        )
      )
    );
  }

}