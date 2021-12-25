import 'package:digitaldungeons/utils/index.dart';
import 'package:flutter/material.dart';

import '../../widgets/index.dart';

class DDCharacteristicsScreen extends StatelessWidget {
  DDCharacteristicsScreen({Key? key}) : super(key: key);

  TextEditingController _strengthController = TextEditingController(text: 'default');
  TextEditingController _dexterityController = TextEditingController();
  TextEditingController _constitutionController = TextEditingController();
  TextEditingController _intelectController = TextEditingController();
  TextEditingController _wisdomController = TextEditingController();
  TextEditingController _charismaController = TextEditingController();
  TextEditingController _perceptionController = TextEditingController();

  static const pageIndex = 3;

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
                                  'Characteristics',
                                  textAlign: TextAlign.center,
                                  style: DDTextTheme.Raleway36AccentSemiBold,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                // DDInputText(fieldName: "Strength", controller: _strengthController),
                                // DDInputText(fieldName: "Dexterity", controller: _dexterityController),
                                // DDInputText(fieldName: "Constitution", controller: _constitutionController),
                                // DDInputText(fieldName: "Intelect", controller: _intelectController),
                                // DDInputText(fieldName: "Wisdom", controller: _wisdomController),
                                // DDInputText(fieldName: "Charisma", controller: _charismaController),
                                // DDInputText(fieldName: "Perception", controller: _perceptionController),

                                DDSwitchPagesController(leftRoute: DDRoutes.StoryNPersonalityInfo, rightRoute: DDRoutes.ProficienciesNTraitsInfo,),

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
