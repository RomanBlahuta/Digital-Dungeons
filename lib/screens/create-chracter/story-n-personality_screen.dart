import 'package:digitaldungeons/blocs/character/character-edit/character-edit_bloc.dart';
import 'package:digitaldungeons/blocs/character/character-edit/character-edit_state.dart';
import 'package:digitaldungeons/blocs/character/character-edit/character-edit_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:digitaldungeons/utils/index.dart';
import 'package:flutter/material.dart';

import '../../widgets/index.dart';

class DDStoryNRersonalityScreen extends StatelessWidget {
  DDStoryNRersonalityScreen({Key? key}) : super(key: key);

  TextEditingController _alignmentController = TextEditingController(text: 'default');
  TextEditingController _personalityTraitsController = TextEditingController();
  TextEditingController _idealsController = TextEditingController();
  TextEditingController _bondsController = TextEditingController();
  TextEditingController _flawsController = TextEditingController();

  static const pageIndex = 2;

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
                                  'Story & Personality',
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
                                  DDInputText(displayName: "Alignment", controller: TextEditingController(text: characterDataState.characterData["alignment"]), fieldName: "alignment",),
                                  DDInputText(displayName: "Personality Traits", controller: TextEditingController(text: characterDataState.characterData["personality"]), fieldName: "personality",),
                                  DDInputText(displayName: "Ideals", controller: TextEditingController(text: characterDataState.characterData["ideals"]), fieldName: "ideals",),
                                  DDInputText(displayName: "Bonds", controller: TextEditingController(text: characterDataState.characterData["bonds"]), fieldName: "bonds",),
                                  DDInputText(displayName: "Flaws", controller: TextEditingController(text: characterDataState.characterData["flaws"]), fieldName: "flaws",),
                                ]
                                );
                                }
                                else {
                                  return SizedBox.shrink();
                                }
                                }),
                                DDSwitchPagesController(leftRoute: DDRoutes.HPInfo, rightRoute: DDRoutes.CharacteristicsInfo,),

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
