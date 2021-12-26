import 'package:digitaldungeons/blocs/character/character-edit/character-edit_bloc.dart';
import 'package:digitaldungeons/blocs/character/character-edit/character-edit_state.dart';
import 'package:digitaldungeons/blocs/character/character-edit/character-edit_events.dart';
import 'package:digitaldungeons/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/index.dart';

class DDGeneralInfoScreen extends StatelessWidget {
  DDGeneralInfoScreen({Key? key}) : super(key: key);

  TextEditingController _nameController = TextEditingController(text: 'default');
  TextEditingController _playerController = TextEditingController();
  TextEditingController _levelController = TextEditingController();
  TextEditingController _classController = TextEditingController();
  TextEditingController _raceController = TextEditingController();
  TextEditingController _backgroundController = TextEditingController();

  static const pageIndex = 0;

  // String name = '';
  // String player = '';
  // String level = '';
  // String char_class = '';
  // String race = '';
  // String background = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                  'General Info',
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
                                          DDInputText(displayName: "Name", controller: TextEditingController(text: characterDataState.characterData["name"]), fieldName: "name",),
                                          DDInputText(displayName: "Player", controller: TextEditingController(text: characterDataState.characterData["player"]), fieldName: "player"),
                                          DDInputText(displayName: "Level", controller: TextEditingController(text: characterDataState.characterData["level"]), fieldName: "level"),
                                          DDInputText(displayName: "Class", controller: TextEditingController(text: characterDataState.characterData["charClass"]), fieldName: "charClass"),
                                          DDInputText(displayName: "Race", controller: TextEditingController(text: characterDataState.characterData["race"]), fieldName: "race"),
                                          DDInputText(displayName: "Background", controller: TextEditingController(text: characterDataState.characterData["background"]), fieldName: "background")
                                        ]
                                    );
                                  }
                                  else {
                                    return SizedBox.shrink();
                                  }
                                }),
                                DDSwitchPagesController(rightRoute: DDRoutes.HPInfo,),
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

    );
  }
}
