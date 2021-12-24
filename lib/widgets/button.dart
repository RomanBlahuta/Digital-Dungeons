import 'package:flutter/material.dart';

class DDButtonSizes {
  static Size Small = Size(146, 46);
  static Size Large = Size(178, 53);
}

enum DDButtonType {
  Outlined,
  Filled,
}

class DDButton extends StatelessWidget {
  final Color color;
  final String text;
  final DDButtonType type;
  final Size size;
  final TextStyle textStyle;
  final void Function() onPressed;

  DDButton({Key? key, required this.text, required this.onPressed, required this.color, required this.type, required this.size, required this.textStyle}): super(key: key);
  
  @override
  Widget build(BuildContext context) {
    switch (type) {
      case DDButtonType.Filled:
        return ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(size),
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
            style: textStyle,
          ),
        );
      case DDButtonType.Outlined:
        return OutlinedButton(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: textStyle,
          ),
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            minimumSize: size,
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