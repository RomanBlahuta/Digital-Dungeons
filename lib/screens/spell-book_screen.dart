import 'package:digitaldungeons/blocs/spell/spell-list/spell-list_bloc.dart';
import 'package:digitaldungeons/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/index.dart';

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
    return BlocProvider<DDSpellListBloc>(
      create: (providerContext) => DDSpellListBloc(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: DDTheme.darkColor,
          appBar: DDAppBar(),
          body: Builder(
            builder: (context) => SingleChildScrollView(
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
                          onPressed: () {Navigator.pushNamed(context, DDRoutes.SpellSheet);},
                        );
                      }
                  ),
                ],
              ),
            ),
          )
        )
      ),
    );
  }
}
