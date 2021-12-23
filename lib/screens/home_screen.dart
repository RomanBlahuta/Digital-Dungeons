import 'package:digitaldungeons/utils/index.dart';
import 'package:digitaldungeons/widgets/category_button.dart';
import 'package:digitaldungeons/widgets/user_profile.dart';
import 'package:flutter/material.dart';

class DDHomeScreen extends StatelessWidget {

  final String userName = "Name Surname";
  final String userEmail = "example@gmail.com";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: DDTheme.darkColor,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {Navigator.pushNamed(context, DDRoutes.Home);},
                icon: const Icon(
                  Icons.home,
                  color: DDTheme.darkColor,
                  size: 35,
                )
            ),
            title: Text("DIGITAL DUNGEONS",
              style: DDTextTheme.Raleway20BlackSemiBold,),
            actions: <Widget> [
              IconButton(
                  onPressed: () { print('Click!'); },
                  icon: const Icon(
                    Icons.logout,
                    color: DDTheme.darkColor,
                    size: 35,
                  )
              )
            ],
            backgroundColor: DDTheme.primaryColor,
          ),
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
                    text: "CREATE CHARACTER",
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
                    onPressed: () {print("Click event on Container");},
                    icon: DDMagicIcon,
                    background: DDMagicBack
                ),
                SizedBox(
                  height: 44.0,
                ),
                DDCategoryButton(
                    text: "ITEMS",
                    onPressed: () {print("Click event on Container");},
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