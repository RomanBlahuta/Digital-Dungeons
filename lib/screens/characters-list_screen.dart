import 'package:digitaldungeons/utils/index.dart';
import 'package:digitaldungeons/widgets/app-bar.dart';
import 'package:flutter/material.dart';

import '../widgets/list-button.dart';

class DDCharactersListScreen extends StatelessWidget {

  static const List<Map> _currentCharacters = [
    // {'name' : 'Rowan Birch', 'info' : 'cleric 8 lvl', 'icon' : DDKnightIcon},
    // {'name' : 'Rowan Birch', 'info' : 'cleric 9 lvl', 'icon' : DDKnightIcon},
    // {'name' : 'Rowan Birch', 'info' : 'cleric 7 lvl', 'icon' : DDKnightIcon},
    // {'name' : 'Rowan Birch', 'info' : 'cleric 8 lvl', 'icon' : DDKnightIcon},
    // {'name' : 'Rowan Birch', 'info' : 'cleric 9 lvl', 'icon' : DDKnightIcon}
  ];

  static const List<Map> _savedCharacters = [
    {'name' : 'Rowan Birch', 'info' : 'cleric 7 lvl', 'icon' : DDKnightIcon},
    {'name' : 'Rowan Birch', 'info' : 'cleric 8 lvl', 'icon' : DDKnightIcon},
    {'name' : 'Rowan Birch', 'info' : 'cleric 9 lvl', 'icon' : DDKnightIcon},
    {'name' : 'Rowan Birch', 'info' : 'cleric 7 lvl', 'icon' : DDMonsterIcon},
    {'name' : 'Rowan Birch', 'info' : 'cleric 8 lvl', 'icon' : DDKnightIcon},
    {'name' : 'Rowan Birch', 'info' : 'cleric 9 lvl', 'icon' : DDKnightIcon},
    {'name' : 'Rowan Birch', 'info' : 'cleric 7 lvl', 'icon' : DDKnightIcon},
    {'name' : 'Rowan Birch', 'info' : 'cleric 8 lvl', 'icon' : DDKnightIcon},
    {'name' : 'Rowan Birch', 'info' : 'cleric 9 lvl', 'icon' : DDKnightIcon},
  ];

  const DDCharactersListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: DDTheme.darkColor,
          appBar: DDAppBar(),
          body: SingleChildScrollView (
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding (
                  padding: EdgeInsets.only(left: 20, top: 22, bottom: 22),
                  child: Text("CURRENTLY USED", style: DDTextTheme.Raleway30AccentBold,),
                ),
                (_currentCharacters.length > 0)
                    ?
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 20),
                    itemCount: _currentCharacters.length,
                    itemBuilder: (context, index) {
                      return DDListButton(
                        name: _currentCharacters[index]['name'],
                        info: _currentCharacters[index]['info'],
                        icon: _currentCharacters[index]['icon'],
                        onPressed: () {},
                      );
                    }
                )
                    :
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Please create new character for the game  or choose one from the saved.',
                    style: DDTextTheme.Raleway18WhiteRegular,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding (
                  padding: EdgeInsets.only(left: 20, top: 22, bottom: 22),
                  child: Text("SAVED CHARACTERS", style: DDTextTheme.Raleway30AccentBold,),
                ),
                (_savedCharacters.length > 0)
                    ?
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 20),
                    itemCount: _savedCharacters.length,
                    itemBuilder: (context, index) {
                      return DDListButton(
                        name: _savedCharacters[index]['name'],
                        info: _savedCharacters[index]['info'],
                        icon: _savedCharacters[index]['icon'],
                        onPressed: () {},
                      );
                    }
                )
                    :
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "You don't have any saved characters yet",
                    style: DDTextTheme.Raleway18WhiteRegular,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: DDTheme.accentColor,
            child: const Icon(Icons.add),
            splashColor: DDTheme.primaryColor,
          ),
        ),
    );
  }
}



