import 'package:digitaldungeons/utils/index.dart';
import 'package:flutter/material.dart';

class DDTextTheme {
  static const TextStyle Raleway20BlackSemiBold = TextStyle(
    color: DDTheme.darkColor,
    fontWeight: FontWeight.w600,
    fontFamily: "Raleway",
    fontSize: 20
  );

  static const TextStyle Raleway24BlackBold = TextStyle(
    color: DDTheme.darkColor,
    fontWeight: FontWeight.w700,
    fontFamily: "Raleway",
    fontSize: 24
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
    fontSize: 30
  );

  static const TextStyle Raleway24PrimaryBold = TextStyle(
    color: DDTheme.primaryColor,
    fontWeight: FontWeight.w700,
    fontFamily: "Raleway",
    fontSize: 24
  );

  static const TextStyle Raleway36PrimaryBold = TextStyle(
    color: DDTheme.primaryColor,
    fontWeight: FontWeight.w700,
    fontFamily: "Raleway",
    fontSize: 36,
  );
}
