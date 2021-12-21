import 'package:digitaldungeons/utils/index.dart';
import 'package:digitaldungeons/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DDButtonSize {
  final double width;
  final double height;
  final double fontSize;

  const DDButtonSize(this.width, this.height, this.fontSize);
}

class DDButtonSizes {
  static DDButtonSize Small = DDButtonSize(146, 46, 18);
  static DDButtonSize Large = DDButtonSize(178, 53, 24);
}

enum DDButtonType {
  Outlined,
  Filled,
}

class DDButton extends StatelessWidget {
  final Color color;
  final String text;
  final DDButtonType type;
  final DDButtonSize size;
  final void Function() onPressed;

  DDButton({Key? key, required this.text, required this.onPressed, required this.color, required this.type, required this.size}): super(key: key);
  
  @override
  Widget build(BuildContext context) {
    switch (type) {
      case DDButtonType.Filled:
        return ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(color: Colors.transparent)
              )
            ),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: size.fontSize,
              color: DDTheme.darkColor,
              fontWeight: FontWeight.bold
            ),
          ),
        );
      case DDButtonType.Outlined:
        return OutlinedButton(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: size.fontSize,
              color: color,
              fontWeight: FontWeight.bold
            ),
          ),
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            side: BorderSide(color: color, width: 3),
          ),
        );
      default: 
      return Text(
        'DDButton ERROR', 
        style: TextStyle(
          color: Colors.red, 
          fontWeight: FontWeight.bold
        ),
      );
    }
  }
  
}