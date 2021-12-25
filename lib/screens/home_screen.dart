import 'package:digitaldungeons/utils/index.dart';
import 'package:flutter/material.dart';
// import 'package:digitaldungeons/repositories/database_repository.dart';
// import 'package:digitaldungeons/models/character_data.dart';

import '../widgets/index.dart';

class DDHomeScreen extends StatelessWidget {

  final String userName = "Name Surname";
  final String userEmail = "example@gmail.com";

  @override
  Widget build(BuildContext context) {
    // final DDDatabaseRepository characterDao = DDDatabaseRepository();
    // final character = Character("test", "123");
    // characterDao.saveCharacter(character);
    return SafeArea(
        child: Scaffold(
          backgroundColor: DDTheme.darkColor,
          appBar: DDAppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 12.0,
                ),
                DDUserProfile(userName: userName, userEmail: userEmail),
                SizedBox(
                  height: 44.0,
                ),
                DDCategoryButton(
                    text: "CHARACTERS",
                    onPressed: () {Navigator.pushNamed(context, DDRoutes.CharactersList);},
                    // onPressed: () {print("Click event on Container");},
                    icon: DDHumanIcon,
                    background: DDCreateCharacterBack
                ),
                SizedBox(
                  height: 44.0,
                ),
                DDCategoryButton(
                    text: "MAGIC",
                    onPressed: () {Navigator.pushNamed(context, DDRoutes.SpellBook);},
                    icon: DDMagicIcon,
                    background: DDMagicBack
                ),
                SizedBox(
                  height: 44.0,
                ),
                DDCategoryButton(
                    text: "ITEMS",
                    onPressed: () {Navigator.pushNamed(context, DDRoutes.ItemList);},
                    icon: DDSwordIcon,
                    background: DDItemsBack
                ),
                SizedBox(
                  height: 44.0,
                ),
                DDCategoryButton(
                    text: "MONSTERS",
                    onPressed: () {print("Click event on Container");},
                    icon: DDMonsterIcon,
                    background: DDMonstersBack
                ),
                SizedBox(
                  height: 44.0,
                ),
                DDCategoryButton(
                    text: "RACES",
                    onPressed: () {print("Click event on Container");},
                    icon: DDElfIcon,
                    background: DDRacesBack
                ),
                SizedBox(
                  height: 44.0,
                ),
                DDCategoryButton(
                    text: "CLASSES",
                    onPressed: () {print("Click event on Container");},
                    icon: DDKnightIcon,
                    background: DDClassesBack
                ),
                SizedBox(
                  height: 44.0,
                ),
              ],
            ),
          ),
        )
    );
  }
}