import 'package:digitaldungeons/utils/index.dart';
import 'package:digitaldungeons/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:digitaldungeons/blocs/character/character-edit/character-edit_bloc.dart';
import 'package:digitaldungeons/blocs/character/character-edit/character-edit_state.dart';
import 'package:digitaldungeons/blocs/character/character-edit/character-edit_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';

import 'create-chracter/general-info_screen.dart';

class DDCharacterSheetScreen extends StatelessWidget {
  Map<String, String> characterData;
  DDCharacterSheetScreen({ Key? key, required this.characterData }) : super(key: key);

  final List<String> mockDataMain = [
    'Player123',
    '30',
    'Paladin',
    'Human',
    'Hermit',
  ];

  final List<String> mockDataGeneral = [
    '11',
    '10',
    '100',
    '+10',
    '15',
    '30 ft',
    '1d8',
    '0/1'
  ];
  final List<String> mockDataCharacteristics = [
    '15+1',
    '10+2',
    '17+5',
    '16+1',
    '14+1',
    '10+1',
    '9+5',
  ];

  final List<List<String>> mockDataStory = [
    ['1Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'],
    ['2Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'],
    ['3Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'],
    ['4Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'],
    ['1d20 + 3']
  ];

  final List<List<String>> mockDataProficiencies = [
    ['11Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'],
    ['22Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'],
  ];

  final List<List<String>> mockDataWeaponsMagic = [
    ['Sword', 'Dagger', 'Mace'],
    ['+5', '+4', '+2'],
    ['1d6 + Slashing', '1d6 + Piercing', '1d6 + Bludgeoning'],
  ];

  final List<List<String>> mockDataInventory = [
    ['Gold Coins x50', 'Silver Coins x130'],
    ['Sword', 'Shield', 'Poison', 'A Bag of Holding'],
  ];

  final Map<String, List<List<dynamic>>> mockDataSkillsAndSavingThrows = {
    'Skills': [
      [true, '+1', 'Acrobatics(Dex)'],
      [false, '+1', 'Animal Handling(Wis)'],
      [true, '+1', 'Acrobatics(Dex)'],
      [false, '+1', 'Animal Handling(Wis)'],
      [true, '+1', 'Acrobatics(Dex)'],
      [false, '+1', 'Animal Handling(Wis)'],
      [true, '+1', 'Acrobatics(Dex)'],
      [false, '+1', 'Animal Handling(Wis)'],
      [true, '+1', 'Acrobatics(Dex)'],
      [false, '+1', 'Animal Handling(Wis)'],
      [true, '+1', 'Acrobatics(Dex)'],
      [false, '+1', 'Animal Handling(Wis)'],
      [true, '+1', 'Acrobatics(Dex)'],
      [false, '+1', 'Animal Handling(Wis)'],
      [true, '+1', 'Acrobatics(Dex)'],
      [false, '+1', 'Animal Handling(Wis)'],
      [true, '+1', 'Acrobatics(Dex)'],
      [false, '+1', 'Animal Handling(Wis)'],
    ],
    'Saving Throws': [
      [true, '+1', 'Strength'],
      [false, '+1', 'Dexteruty'],
      [true, '+1', 'Constitution'],
      [false, '+1', 'Intelligence'],
      [true, '+1', 'Wisdom'],
      [false, '+1', 'Charisma'],
    ],
    
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DDTheme.lightColor,
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              BlocBuilder<DDCharacterEditBloc, DDCharacterState>(builder: (_, characterMapState) {

                if (characterMapState is DDCharacterDataState) {

                  // Map<String, String> characterData = characterMapState.characterData;
                  final List<String> dataMain = [
                    characterData["player"].toString(),
                    characterData["level"].toString(),
                    characterData["charClass"].toString(),
                    characterData["race"].toString(),
                    characterData["background"].toString(),
                  ];

                  final List<String> dataGeneral = [
                    characterData["experience"].toString(),
                    characterData["initiative"].toString(),
                    characterData["armor"].toString(),
                    characterData["speed"].toString(),
                    characterData["hit_dice"].toString(),
                    characterData["death_saves"].toString(),
                  ];

                  final List<String> dataCharacteristics = [
                    characterData["strength"].toString(),
                    characterData["dexterity"].toString(),
                    characterData["constitution"].toString(),
                    characterData["intelect"].toString(),
                    characterData["wisdom"].toString(),
                    characterData["charisma"].toString(),
                    characterData["perception"].toString(),
                  ];

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 520,
                        decoration: BoxDecoration(
                            color: DDTheme.darkColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                            )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 91,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundColor: DDTheme.accentColor,
                                  child: CircleAvatar(
                                    backgroundColor: DDTheme.darkColor,
                                    backgroundImage: AssetImage(DDKnightIcon),
                                    radius: 73,
                                  ),
                                  radius: 75,
                                ),

                                SizedBox(
                                  width: 42,
                                ),

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    DDButton(
                                      text: 'EDIT',
                                      textStyle: DDTextTheme.Raleway18BlackBold,
                                      onPressed: () => {
                                        context.read<DDCharacterEditBloc>().add(DDEditPrevCharacterFieldEvent(characterData)),
                                        Navigator.pushNamed(context, DDRoutes.GeneralInfo)
                                        // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                                        //   return DDGeneralInfoScreen(characterData: characterData);
                                        // }))
                                      },
                                      size: DDButtonSizes.Small,
                                      color: DDTheme.primaryColor,
                                      type: DDButtonType.Filled,
                                    ),

                                    SizedBox(
                                      height: 12,
                                    ),

                                    DDButton(
                                      text: 'DELETE',
                                      textStyle: DDTextTheme
                                          .Raleway18PrimaryBold,
                                      onPressed: () => {
                                          context.read<DDCharacterEditBloc>().add(DDDeleteCharacterEvent(characterData)),
                                          Navigator.pushNamed(context, DDRoutes.CharactersList)
                                      },
                                      size: DDButtonSizes.Small,
                                      color: DDTheme.primaryColor,
                                      type: DDButtonType.Outlined,
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 24,
                            ),

                            Text(
                              characterData["name"].toString(),
                              textAlign: TextAlign.center,
                              style: DDTextTheme.Raleway24PrimaryBold,
                            ),

                            SizedBox(height: 16),

                            DDInfoSection.main(
                                DDCharacterMainInfo, dataMain)
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 24,
                      ),
                      DDInfoSection.parameter(
                          'GENERAL', DDCharacterGeneralInfo, dataGeneral),
                      SizedBox(
                        height: 24,
                      ),
                      DDInfoSection.parameter(
                          'CHARACTERISTICS', DDCharacterCharacteristicsInfo,
                          dataCharacteristics),
                      SizedBox(
                        height: 24,
                      ),
                      DDInfoSection.text(
                          'STORY & PERSONALITY', DDCharacterStoryInfo,
                          mockDataStory),
                      SizedBox(
                        height: 24,
                      ),
                      DDInfoSection.text(
                          'PROFICIENCIES & TRAITS',
                          DDCharacterProficienciesInfo,
                          mockDataProficiencies),
                      SizedBox(
                        height: 24,
                      ),
                      DDInfoSection.column_parameters(
                          'WEAPONS AND SPELLS', DDCharaterWeaponsMagicInfo,
                          mockDataWeaponsMagic),
                      SizedBox(
                        height: 24,
                      ),
                      DDInfoSection.text('INVENTORY', DDCharacterInventoryInfo,
                          mockDataInventory),
                      SizedBox(
                        height: 24,
                      ),
                      DDInfoSection.skills('SKILLS & SAVING THROWS',
                          mockDataSkillsAndSavingThrows),
                      SizedBox(
                        height: 24,
                      ),
                    ],
                  );
                }
                else {
                  log(characterMapState.runtimeType.toString());
                  return SizedBox.shrink();
                }
              }),

              Positioned(
                top: 24,
                right: 24,
                child: IconButton(
                  iconSize: 54,
                  icon: Image.asset(DDCloseIcon),
                  onPressed: () => Navigator.pushNamed(context, DDRoutes.CharactersList),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: DDTheme.accentColor,
          child: const Icon(Icons.sports_esports),
          splashColor: DDTheme.primaryColor,
        ),
      ),
    );
  }
}