import 'package:digitaldungeons/blocs/character/character-edit/character-edit_bloc.dart';
import 'package:digitaldungeons/blocs/character/character-edit/character-edit_state.dart';
import 'package:digitaldungeons/blocs/character/character-edit/character-edit_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                                BlocBuilder<DDCharacterEditBloc, DDCharacterState>(builder: (_, characterDataState) {
                                if (characterDataState is DDCharacterDataState){
                                return Column(
                                children: [
                                DDInputText(displayName: "Experience", controller: TextEditingController(text: characterDataState.characterData["experience"]), fieldName: "experience",),
                                DDInputText(displayName: "Initiative", controller: TextEditingController(text: characterDataState.characterData["initiative"]), fieldName: "initiative",),
                                DDInputText(displayName: "Armor", controller: TextEditingController(text: characterDataState.characterData["armor"]), fieldName: "armor",),
                                DDInputText(displayName: "Speed", controller: TextEditingController(text: characterDataState.characterData["speed"]), fieldName: "speed",),
                                DDInputText(displayName: "Hit Dice", controller: TextEditingController(text: characterDataState.characterData["hit_dice"]), fieldName: "hit_dice",),
                                DDInputText(displayName: "Death Saves", controller: TextEditingController(text: characterDataState.characterData["death_saves"]), fieldName: "death_saves",),
                                ]
                                );
                                }
                                else {
                                  return SizedBox.shrink();
                                }
                                }),
                                DDSwitchPagesController(leftRoute: DDRoutes.GeneralInfo, rightRoute: DDRoutes.StoryNPersonalityInfo,),

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
                      onPressed: () => {
                        Navigator.pushNamed(context, DDRoutes.CharactersList),
                        context.read<DDCharacterEditBloc>().add(DDClearCharacterDataEvent())
                      },
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }
}
