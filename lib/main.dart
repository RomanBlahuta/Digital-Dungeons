import 'package:digitaldungeons/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      
      onGenerateRoute: (settings) {

        if (settings.name == '/') {
          return CupertinoPageRoute(builder: (context) => WelcomeScreen('Home'));
        }
      }
    );
  }
}