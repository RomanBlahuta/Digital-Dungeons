import 'package:digitaldungeons/blocs/spell/spell-sheet/spell-sheet_bloc.dart';
import 'package:digitaldungeons/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/index.dart';

class DDSpellSheetScreen extends StatelessWidget {
  DDSpellSheetScreen({Key? key}) : super(key: key);

  final List<String> mockDataMain = [
    '1 action',
    '150 feet',
    'V S M',
    'Instantaneous',
    'Sorcerer, Wizard',
  ];

  final List<String> mockDataDescription = [
    '1Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
    '2Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DDSpellSheetBloc>(
      create: (providerContext) => DDSpellSheetBloc(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: DDTheme.lightColor,
          body: Builder(
            builder: (context) => SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 431,
                        decoration: BoxDecoration(
                            color: DDTheme.darkColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                            )
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            Text(
                              'Chain Lightning',
                              textAlign: TextAlign.center,
                              style: DDTextTheme.Raleway36PrimarySemiBold,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              '6 level evocation',
                              textAlign: TextAlign.center,
                              style: DDTextTheme.Raleway20AccentRegular,
                            ),
                            SizedBox(height: 33),
                            DDInfoSection.main(DDSpellMainInfo, mockDataMain)
                          ],
                        ),
                      ),
                      SizedBox(height: 24,),
                      DDInfoSection.description(DDSpellDescriptionInfo, mockDataDescription,),
                    ],
                  ),
                  Positioned(
                    top: 24,
                    right: 24,
                    child: IconButton(
                      iconSize: 54,
                      icon: Image.asset(DDCloseIcon),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              )
            ),
          ),
        )
      ),
    );
  }
}
