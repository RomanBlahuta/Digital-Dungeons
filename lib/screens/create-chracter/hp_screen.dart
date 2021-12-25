import 'package:digitaldungeons/utils/index.dart';
import 'package:flutter/material.dart';

import '../../widgets/index.dart';

class DDHPScreen extends StatelessWidget {
  DDHPScreen({Key? key}) : super(key: key);

  TextEditingController _experienceController = TextEditingController(text: 'default');
  TextEditingController _initiativeController = TextEditingController();
  TextEditingController _armorController = TextEditingController();
  TextEditingController _speedController = TextEditingController();
  TextEditingController _hitDiceController = TextEditingController();
  TextEditingController _dethSavesController = TextEditingController();

  static const pageIndex = 1;

  // String name = '';
  // String player = '';
  // String level = '';
  // String char_class = '';
  // String race = '';
  // String background = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: DDTheme.lightColor,
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 211,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage (
                          image: AssetImage(DDCreateCharacterBack),
                          fit: BoxFit.cover,
                        )
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: DDDotsIndicator(
                          len: DDCreateCharacterScreensAmount,
                          indicate: pageIndex
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 133,),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          // height: 431,
                          decoration: BoxDecoration(
                              color: DDTheme.lightColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                              )
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 22,
                                ),
                                Text(
                                  'HP',
                                  textAlign: TextAlign.center,
                                  style: DDTextTheme.Raleway36AccentSemiBold,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                DDInputText(fieldName: "Experience", controller: _experienceController),
                                DDInputText(fieldName: "Initiative", controller: _initiativeController),
                                DDInputText(fieldName: "Armor", controller: _armorController),
                                DDInputText(fieldName: "Speed", controller: _speedController),
                                DDInputText(fieldName: "Hit Dice", controller: _hitDiceController),
                                DDInputText(fieldName: "Death Saves", controller: _dethSavesController),
                                Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: IconButton(
                                        iconSize: 77,
                                        icon: Image.asset(DDArrowLeftIcon),
                                        onPressed: () {
                                          print(_experienceController.text);
                                          Navigator.pushNamed(context, DDRoutes.GeneralInfo);
                                          },
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: IconButton(
                                        iconSize: 77,
                                        icon: Image.asset(DDArrowIcon),
                                        onPressed: () => print(_experienceController.text),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30,),
                              ],
                            ),
                          )
                      ),
                    ],
                  ),
                  Positioned(
                    top: 24,
                    right: 24,
                    child: IconButton(
                      iconSize: 54,
                      icon: Image.asset(DDCloseLightIcon),
                      onPressed: () => print('Close button click event'),
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }
}
