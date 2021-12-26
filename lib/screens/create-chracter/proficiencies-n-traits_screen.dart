import 'package:digitaldungeons/blocs/character/character-edit/character-edit_bloc.dart';
import 'package:digitaldungeons/blocs/character/character-edit/character-edit_state.dart';
import 'package:digitaldungeons/blocs/character/character-edit/character-edit_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:digitaldungeons/utils/index.dart';
import 'package:flutter/material.dart';

import '../../widgets/index.dart';

class DDProficienciesNTraitsScreen extends StatelessWidget {
  DDProficienciesNTraitsScreen({Key? key}) : super(key: key);

  TextEditingController _otherProficienciesNLanguagesController = TextEditingController(text: 'default');
  TextEditingController _featuresNTraitsController = TextEditingController();

  static const pageIndex = 4;

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
                                  'Proficiencies & Traits',
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
                                          DDInputText(displayName: "Other Proficiencies & Languages", controller: TextEditingController(text: characterDataState.characterData["proficiencies"]), fieldName: "proficiencies",),
                                          DDInputText(displayName: "Features &Traits", controller: TextEditingController(text: characterDataState.characterData["features"]), fieldName: "features",),
                                    ]
                                    );
                                  }
                                  else {
                                  return SizedBox.shrink();
                                  }
                                }),
                                DDSwitchPagesController(leftRoute: DDRoutes.CharacteristicsInfo, rightRoute: DDRoutes.AttacksNSpellcastingInfo,),

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
