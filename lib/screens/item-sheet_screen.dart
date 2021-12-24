import 'package:digitaldungeons/utils/index.dart';
import 'package:digitaldungeons/widgets/index.dart';
import 'package:flutter/material.dart';

class DDItemSheetScreen extends StatelessWidget {
  DDItemSheetScreen({Key? key}) : super(key: key);

  final List<String> mockDataMain = [
    'Items',
    '1d4',
    'Piercing',
    'Piercing',
    'Weapon Attacks +1, Weapon Damage +1 fff ff ffff',
    'Finesse, Light, Range, Thrown',
    '20/60',
    'Constitution',
    '2d10',
    '1'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: DDTheme.lightColor,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // height: 431,
                      decoration: BoxDecoration(
                          color: DDTheme.darkColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                          )
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            Text(
                              'Dagger of Venom',
                              textAlign: TextAlign.center,
                              style: DDTextTheme.Raleway36PrimarySemiBold,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              'melee weapon (simple, dagger)dddddddddddddddddddddddddddddddddddddddddddd',
                              textAlign: TextAlign.center,
                              style: DDTextTheme.Raleway20AccentRegular,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      )
                    ),
                    SizedBox(height: 30,),
                    // DDInfoSection.description(DDItemInfo, mockDataMain),
                    DDInfoSection.row_parametrs(DDItemInfo, mockDataMain)
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
                ),
              ],
            ),
          )
        )
    );
  }
}
