import 'package:digitaldungeons/utils/index.dart';
import 'package:flutter/material.dart';

import '../../widgets/index.dart';

class DDAttacksNSpellcastingScreen extends StatelessWidget {
  DDAttacksNSpellcastingScreen({Key? key}) : super(key: key);

  TextEditingController _nameController01 = TextEditingController(text: 'default');
  TextEditingController _ATKBonusController01 = TextEditingController();
  TextEditingController _damageTypeController01 = TextEditingController();
  TextEditingController _descriptionController01 = TextEditingController();

  static const pageIndex = 5;

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
                                  'Attacks & Spellcasting',
                                  textAlign: TextAlign.center,
                                  style: DDTextTheme.Raleway36AccentSemiBold,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                DDInputText(fieldName: "Name", controller: _nameController01),
                                DDInputText(fieldName: "ATK Bonus", controller: _ATKBonusController01),
                                DDInputText(fieldName: "Damage/Type", controller: _damageTypeController01),
                                DDInputText(fieldName: "Description", controller: _descriptionController01),

                                Divider(
                                  color: DDTheme.accentColor,
                                  thickness: 2.0,
                                ),

                                DDSwitchPagesController(leftRoute: DDRoutes.ProficienciesNTraitsInfo, rightRoute: DDRoutes.ProficienciesNTraitsInfo,),

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
