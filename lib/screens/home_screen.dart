import 'package:digitaldungeons/utils/index.dart';
import 'package:flutter/material.dart';
import "package:digitaldungeons/repositories/auth_repository.dart";

import '../widgets/index.dart';

class DDHomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
                DDUserProfile(userName: DDAuthRepository.getCurrentUser()?.displayName, userEmail: DDAuthRepository.getCurrentUser()?.email),
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