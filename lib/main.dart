import 'package:digitaldungeons/screens/characters_list_sreen.dart';
import 'package:digitaldungeons/screens/home_screen.dart';
import 'package:digitaldungeons/screens/index.dart';
import 'package:digitaldungeons/screens/spell_book_screen.dart';
import 'package:digitaldungeons/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: (settings) {
        if (settings.name == DDRoutes.Welcome) {
          return MaterialPageRoute(builder: (context) => DDHomeScreen());
          // return MaterialPageRoute(builder: (context) => DDWelcomeScreen('Home'));
        }
        else if (settings.name == 'sign-in') {
          return MaterialPageRoute(builder: (context) => Text('Sign In'));
        }
        else if (settings.name == 'sign-up') {
          return MaterialPageRoute(builder: (context) => Text('Sign Up'));
        }
        else if (settings.name == DDRoutes.Home) {
          return MaterialPageRoute(builder: (context) => DDHomeScreen());
        }
        else if (settings.name == DDRoutes.CharactersList) {
          return MaterialPageRoute(builder: (context) => DDCharactersListScreen());
        }
        else if (settings.name == DDRoutes.SpellBook) {
          return MaterialPageRoute(builder: (context) => DDSpellBookScreen());
        }
      }
    );
  }
}