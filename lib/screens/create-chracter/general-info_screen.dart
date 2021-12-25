import 'package:digitaldungeons/utils/index.dart';
import 'package:flutter/material.dart';

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
                                  'General Info',
                                  textAlign: TextAlign.center,
                                  style: DDTextTheme.Raleway36AccentSemiBold,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                DDInputText(fieldName: "Name", controller: _nameController),
                                DDInputText(fieldName: "Player", controller: _playerController),
                                DDInputText(fieldName: "Level", controller: _levelController),
                                DDInputText(fieldName: "Class", controller: _classController),
                                DDInputText(fieldName: "Race", controller: _raceController),
                                DDInputText(fieldName: "Background", controller: _backgroundController),

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
