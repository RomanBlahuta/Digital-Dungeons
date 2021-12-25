import 'package:digitaldungeons/utils/index.dart';
import 'package:flutter/material.dart';

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
                                DDInputText(fieldName: "Money", controller: _moneyController),
                                DDInputText(fieldName: "Equipment", controller: _equipmentsController),

                                SizedBox(height: 50,),

                                DDButton(
                                    text: "Save",
                                    onPressed:() {},
                                    color: DDTheme.darkColor,
                                    type: DDButtonType.Filled,
                                    size: DDButtonSizes.Small,
                                    textStyle: DDTextTheme.Raleway18AccentBold
                                ),

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
