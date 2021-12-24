import 'package:digitaldungeons/utils/index.dart';
import 'package:flutter/material.dart';

class DDTextTheme {
  static const TextStyle Raleway18BlackBold = TextStyle(
    color: DDTheme.darkColor,
    fontWeight: FontWeight.w700,
    fontFamily: "Raleway",
    fontSize: 18,
  );

  static const TextStyle Raleway18BlackRegular = TextStyle(
    color: DDTheme.darkColor,
    fontWeight: FontWeight.normal,
    fontFamily: "Raleway",
    fontSize: 18,
  );

  static const TextStyle Raleway18PrimaryBold = TextStyle(
    color: DDTheme.primaryColor,
    fontWeight: FontWeight.w700,
    fontFamily: "Raleway",
    fontSize: 18,
  );
  
  static const TextStyle Raleway20BlackSemiBold = TextStyle(
    color: DDTheme.darkColor,
    fontWeight: FontWeight.w600,
    fontFamily: "Raleway",
    fontSize: 20,
  );

  static const TextStyle Raleway24BlackBold = TextStyle(
    color: DDTheme.darkColor,
    fontWeight: FontWeight.w700,
    fontFamily: "Raleway",
    fontSize: 24,
  );

  static const TextStyle Raleway24BlackSemiBold = TextStyle(
      color: DDTheme.darkColor,
      fontWeight: FontWeight.w600,
      fontFamily: "Raleway",
      fontSize: 24
  );

  static const TextStyle Raleway18WhiteRegular = TextStyle(
    color: Colors.white,
    fontFamily: "Raleway",
    fontSize: 18
  );

  static const TextStyle Raleway20BlackRegular = TextStyle(
      color: DDTheme.darkColor,
      fontFamily: "Raleway",
      fontSize: 20
  );

  static const TextStyle Raleway30WhiteBold = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontFamily: "Raleway",
    fontSize: 30,
  );

  static const TextStyle Raleway30AccentBold = TextStyle(
      color: DDTheme.accentColor,
      fontWeight: FontWeight.w700,
      fontFamily: "Raleway",
      fontSize: 30,
  );

  static const TextStyle Raleway24PrimaryBold = TextStyle(
    color: DDTheme.primaryColor,
    fontWeight: FontWeight.w700,
    fontFamily: "Raleway",
    fontSize: 24,
  );

  static const TextStyle Raleway24AccentBold = TextStyle(
    color: DDTheme.accentColor,
    fontWeight: FontWeight.w700,
    fontFamily: "Raleway",
    fontSize: 24,
  );

  static const TextStyle Raleway20PrimaryBold = TextStyle(
    color: DDTheme.primaryColor,
    fontWeight: FontWeight.w700,
    fontFamily: "Raleway",
    fontSize: 20,
  );

  static const TextStyle Raleway36PrimaryBold = TextStyle(
    color: DDTheme.primaryColor,
    fontWeight: FontWeight.w700,
    fontFamily: "Raleway",
    fontSize: 36,
  );

  static const TextStyle Raleway20WhiteRegular = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.normal,
    fontFamily: "Raleway",
    fontSize: 20,
  );
  
  static const TextStyle Raleway36AccentBoldStroke = TextStyle(
    color: DDTheme.accentColor,
    fontWeight: FontWeight.w700,
    fontFamily: "Raleway",
    fontSize: 36,
    shadows: [
      Shadow( // bottomLeft
          offset: Offset(-2.0, -2.0),
          color: Colors.black
      ),
      Shadow( // bottomRight
          offset: Offset(2.0, -2.0),
          color: Colors.black
      ),
      Shadow( // topRight
          offset: Offset(2.0, 2.0),
          color: Colors.black
      ),
      Shadow( // topLeft
          offset: Offset(-2.0, 2.0),
          color: Colors.black
      ),
    ]
  );
}
