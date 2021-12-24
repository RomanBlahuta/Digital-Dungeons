import 'package:digitaldungeons/utils/index.dart';
import 'package:digitaldungeons/widgets/app-bar.dart';
import 'package:digitaldungeons/widgets/list_button.dart';
import 'package:flutter/material.dart';

import '../widgets/category_header.dart';

class DDSpellBookScreen extends StatelessWidget {
  static const List<Map> _spells = [
    {'name' : 'Chain Lightning', 'info' : '6 lvl evocation'},
    {'name' : 'Chain Lightning', 'info' : '6 lvl evocation'},
    {'name' : 'Chain Lightning', 'info' : '6 lvl evocation'},
    {'name' : 'Chain Lightning', 'info' : '6 lvl evocation'},
    {'name' : 'Chain Lightning', 'info' : '6 lvl evocation'},
    {'name' : 'Chain Lightning', 'info' : '6 lvl evocation'},
    {'name' : 'Chain Lightning', 'info' : '6 lvl evocation'},
  ];

  const DDSpellBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: DDTheme.darkColor,
          appBar: DDAppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                DDCategoryHeader(
                  text: "SPELL BOOK",
                  icon: DDSpellBookIcon,
                  background: DDSpellBookBanner,
                ),
                SizedBox(height: 20,),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 20),
                    itemCount: _spells.length,
                    itemBuilder: (context, index) {
                      return DDListButton(
                        name: _spells[index]['name'],
                        info: _spells[index]['info'],
                        onPressed: () {print('Click');},
                      );
                    }
                ),
              ],
            ),
          ),
        )
    );
  }
}
