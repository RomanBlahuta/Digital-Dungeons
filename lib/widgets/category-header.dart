import 'package:flutter/material.dart';

import '../utils/index.dart';

class DDCategoryHeader extends StatelessWidget {
  final String text;
  final String icon;
  final String background;

  const DDCategoryHeader({Key? key, required this.text, required this.icon, required this.background}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 156,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage (
                image: AssetImage(background),
                fit: BoxFit.cover,
              )
          ),
        ),
        Container(
          color: DDTheme.overlayColor,
          height: 156,
          width: MediaQuery.of(context).size.width,
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, top: 23),
          child: Image(
            height: 133,
            width: 133,
            image: AssetImage(icon),
          ),
        ),
        Positioned(
          right: 30,
          bottom: 12,
          child: Text(text, style: DDTextTheme.Raleway36AccentBoldStroke
          ),
        )
      ],
    );
  }
}
