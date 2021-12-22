import 'package:digitaldungeons/utils/index.dart';
import 'package:digitaldungeons/widgets/index.dart';
import 'package:flutter/material.dart';

class DDCharacterSheetScreen extends StatelessWidget {
  DDCharacterSheetScreen({ Key? key }) : super(key: key);

  final List<String> mockDataMain = [
    'Player123',
    '30',
    'Paladin',
    'Human',
    'Hermit',
  ];

  final List<String> mockDataGeneral = [
    '10',
    '+1',
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DDTheme.lightColor,
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
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
                                  onPressed: () => print('Edit button click event'),
                                  size: DDButtonSizes.Small,
                                  color: DDTheme.primaryColor,
                                  type: DDButtonType.Filled,
                                ),

                                SizedBox(
                                  height: 12,
                                ),

                                DDButton(
                                  text: 'DELETE',
                                  textStyle: DDTextTheme.Raleway18PrimaryBold,
                                  onPressed: () => print('Delete button click event'),
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
                          'Name Surname',
                          textAlign: TextAlign.center,
                          style: DDTextTheme.Raleway24PrimaryBold,
                        ),

                        SizedBox(height: 16),

                        DDInfoSection.main(DDCharacterMainInfo, mockDataMain)
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 24,
                  ),
                  DDInfoSection.parameter('GENERAL', DDCharacterGeneralInfo, mockDataGeneral),
                  SizedBox(
                    height: 24,
                  ),
                  DDInfoSection.parameter('CHARACTERISTICS', DDCharacterCharacteristicsInfo, mockDataCharacteristics),
                ],
              ),

              Positioned(
                top: 24,
                right: 24,
                child: IconButton(
                  iconSize: 54,
                  icon: Image.asset(DDCloseIcon),
                  onPressed: () => print('Close button click event'),
                ),
              )

              //todo
            ],
          ),
        ),
      ),
    );
  }
}