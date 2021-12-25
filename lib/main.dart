import 'package:digitaldungeons/screens/index.dart';
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: DDTheme.accentColor,
      systemNavigationBarColor: DDTheme.accentColor
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      onGenerateRoute: (settings) {
        if (settings.name == DDRoutes.Welcome) {
          // return MaterialPageRoute(builder: (context) => DDHomeScreen());
          return MaterialPageRoute(builder: (context) => DDWelcomeScreen());
          // return MaterialPageRoute(builder: (context) => DDCharacterSheetScreen());
        }
        else if (settings.name == DDRoutes.SignIn) {
          return MaterialPageRoute(builder: (context) => Text('Sign In'));
        }
        else if (settings.name == DDRoutes.SignUp) {
          return MaterialPageRoute(builder: (context) => Text('Sign Up'));
        }
        else if (settings.name == DDRoutes.Home) {
          return MaterialPageRoute(builder: (context) => DDHomeScreen());
        }
        else if (settings.name == DDRoutes.CharacterSheet) {
          return MaterialPageRoute(builder: (context) => DDCharacterSheetScreen());
        }
        else if (settings.name == DDRoutes.CharactersList) {
          return MaterialPageRoute(builder: (context) => DDCharactersListScreen());
        }
        else if (settings.name == DDRoutes.SpellSheet) {
          return MaterialPageRoute(builder: (context) => DDSpellSheetScreen());
        }
        else if (settings.name == DDRoutes.SpellBook) {
          return MaterialPageRoute(builder: (context) => DDSpellBookScreen());
        }
        else if (settings.name == DDRoutes.ItemList) {
          return MaterialPageRoute(builder: (context) => DDItemListScreen());
        }
        else if (settings.name == DDRoutes.ItemSheet) {
          return MaterialPageRoute(builder: (context) => DDItemSheetScreen());
        }
      }
    );
  }
}