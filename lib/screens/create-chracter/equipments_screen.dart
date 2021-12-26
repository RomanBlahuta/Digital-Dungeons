import 'package:digitaldungeons/blocs/character/character-edit/character-edit_bloc.dart';
import 'package:digitaldungeons/blocs/character/character-edit/character-edit_state.dart';
import 'package:digitaldungeons/blocs/character/character-edit/character-edit_events.dart';
import 'package:digitaldungeons/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/index.dart';

class DDEquipmentScreen extends StatelessWidget {
  DDEquipmentScreen({Key? key}) : super(key: key);

  TextEditingController _moneyController = TextEditingController(text: 'default');
  TextEditingController _equipmentsController = TextEditingController();

  static const pageIndex = 6;

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
                                  'Equipment',
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
                                        DDInputText(displayName: "Money", controller: TextEditingController(text: characterDataState.characterData["money"]), fieldName: "money"),
                                        DDInputText(displayName: "Equipment", controller: TextEditingController(text: characterDataState.characterData["equipment"]), fieldName: "equipment"),

                                        SizedBox(height: 50,),

                                        DDButton(
                                            text: "Save",
                                            color: DDTheme.darkColor,
                                            type: DDButtonType.Filled,
                                            size: DDButtonSizes.Small,
                                            textStyle: DDTextTheme.Raleway18AccentBold,
                                            onPressed: () async {

                                              if (characterDataState.characterData["edit"] == "1") {
                                                context.read<DDCharacterEditBloc>().add(DDEditCharacterTabEvent(context));
                                              }
                                              else {
                                                context.read<DDCharacterEditBloc>().add(DDAddNewCharacterTabEvent(context));
                                              }
                                              context.read<DDCharacterEditBloc>().add(DDClearCharacterDataEvent());
                                            }
                                        ),
                                      ]
                                    );
                                  }
                                  else {
                                    return SizedBox.shrink();
                                  }
                                }),

                                SizedBox(height: 50,),

                                DDSwitchPagesController(leftRoute: DDRoutes.AttacksNSpellcastingInfo,),

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
