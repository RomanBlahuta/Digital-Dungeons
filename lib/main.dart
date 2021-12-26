import 'package:digitaldungeons/blocs/character/character-edit/character-edit_bloc.dart';
import 'package:digitaldungeons/screens/index.dart';
import 'package:digitaldungeons/utils/index.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    return BlocProvider<DDCharacterEditBloc>(
      create: (providerContext) => DDCharacterEditBloc(),
      child:
        MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          onGenerateRoute: (settings) {
          if (settings.name == DDRoutes.Welcome) {
            return MaterialPageRoute(builder: (context) => DDWelcomeScreen());
            // return MaterialPageRoute(builder: (context) => DDHomeScreen());
          }
          else if (settings.name == DDRoutes.SignIn) {
            return MaterialPageRoute(builder: (context) => DDSignInScreen());
          }
          else if (settings.name == DDRoutes.SignUp) {
            return MaterialPageRoute(builder: (context) => DDSignUpScreen('Sign Up'));
          }
          else if (settings.name == DDRoutes.Home) {
            return MaterialPageRoute(builder: (context) => DDHomeScreen());
          }
          // else if (settings.name == DDRoutes.CharacterSheet) {
          //   return MaterialPageRoute(builder: (context) => DDCharacterSheetScreen());
          // }
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
          else if (settings.name == DDRoutes.GeneralInfo) {
            return MaterialPageRoute(builder: (context) => DDGeneralInfoScreen());
          }
          else if (settings.name == DDRoutes.HPInfo) {
            return MaterialPageRoute(builder: (context) => DDHPScreen());
          }
          else if (settings.name == DDRoutes.StoryNPersonalityInfo) {
            return MaterialPageRoute(builder: (context) => DDStoryNRersonalityScreen());
          }
          else if (settings.name == DDRoutes.CharacteristicsInfo) {
            return MaterialPageRoute(builder: (context) => DDCharacteristicsScreen());
          }
          else if (settings.name == DDRoutes.ProficienciesNTraitsInfo) {
            return MaterialPageRoute(builder: (context) => DDProficienciesNTraitsScreen());
          }
          else if (settings.name == DDRoutes.AttacksNSpellcastingInfo) {
            return MaterialPageRoute(builder: (context) => DDAttacksNSpellcastingScreen());
          }
          else if (settings.name == DDRoutes.EquipmentInfo) {
            return MaterialPageRoute(builder: (context) => DDEquipmentScreen());
          }
        }
      )
    );
  }
}