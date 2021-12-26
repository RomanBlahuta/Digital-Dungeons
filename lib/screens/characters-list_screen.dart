import 'package:digitaldungeons/blocs/character/character-edit/character-edit_bloc.dart';
import 'package:digitaldungeons/blocs/character/character-edit/character-edit_state.dart';
import 'package:digitaldungeons/blocs/character/character-edit/character-edit_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:digitaldungeons/utils/index.dart';
import 'package:digitaldungeons/utils/navigation.dart';
import 'package:digitaldungeons/widgets/app-bar.dart';
import 'package:flutter/material.dart';

import '../widgets/list-button.dart';

class DDCharactersListScreen extends StatelessWidget {

  static const List<Map> _currentCharacters = [
    // {'name' : 'Rowan Birch', 'info' : 'cleric 8 lvl', 'icon' : DDKnightIcon},
    // {'name' : 'Rowan Birch', 'info' : 'cleric 9 lvl', 'icon' : DDKnightIcon},
    // {'name' : 'Rowan Birch', 'info' : 'cleric 7 lvl', 'icon' : DDKnightIcon},
    // {'name' : 'Rowan Birch', 'info' : 'cleric 8 lvl', 'icon' : DDKnightIcon},
    // {'name' : 'Rowan Birch', 'info' : 'cleric 9 lvl', 'icon' : DDKnightIcon}
  ];

  static const List<Map> _savedCharacters = [
    {'name' : 'Rowan Birch', 'info' : 'cleric 7 lvl', 'icon' : DDKnightIcon},
    {'name' : 'Rowan Birch', 'info' : 'cleric 8 lvl', 'icon' : DDKnightIcon},
    {'name' : 'Rowan Birch', 'info' : 'cleric 9 lvl', 'icon' : DDKnightIcon},
    {'name' : 'Rowan Birch', 'info' : 'cleric 7 lvl', 'icon' : DDMonsterIcon},
    {'name' : 'Rowan Birch', 'info' : 'cleric 8 lvl', 'icon' : DDKnightIcon},
    {'name' : 'Rowan Birch', 'info' : 'cleric 9 lvl', 'icon' : DDKnightIcon},
    {'name' : 'Rowan Birch', 'info' : 'cleric 7 lvl', 'icon' : DDKnightIcon},
    {'name' : 'Rowan Birch', 'info' : 'cleric 8 lvl', 'icon' : DDKnightIcon},
    {'name' : 'Rowan Birch', 'info' : 'cleric 9 lvl', 'icon' : DDKnightIcon},
  ];

  const DDCharactersListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DDCharacterEditBloc>(
        create: (providerContext) => DDCharacterEditBloc()..add(DDGetCharactersEvent()),
        child:  SafeArea(
        child: Scaffold(
          backgroundColor: DDTheme.darkColor,
          appBar: DDAppBar(),
          body: SingleChildScrollView (
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding (
                //   padding: EdgeInsets.only(left: 20, top: 22, bottom: 22),
                //   child: Text("CURRENTLY USED", style: DDTextTheme.Raleway30AccentBold,),
                // ),
                // (_currentCharacters.length > 0)
                //     ?
                // ListView.builder(
                //     shrinkWrap: true,
                //     physics: NeverScrollableScrollPhysics(),
                //     padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 20),
                //     itemCount: _currentCharacters.length,
                //     itemBuilder: (context, index) {
                //       return DDListButton(
                //         name: _currentCharacters[index]['name'],
                //         info: _currentCharacters[index]['info'],
                //         icon: _currentCharacters[index]['icon'],
                //         onPressed: () {},
                //       );
                //     }
                // )
                //     :
                // SizedBox(
                //   width: MediaQuery.of(context).size.width,
                //   child: Text(
                //     'Please create new character for the game  or choose one from the saved.',
                //     style: DDTextTheme.Raleway18WhiteRegular,
                //     textAlign: TextAlign.center,
                //   ),
                // ),
                Padding (
                  padding: EdgeInsets.only(left: 20, top: 22, bottom: 22),
                  child: Text("SAVED CHARACTERS", style: DDTextTheme.Raleway30AccentBold,),
                ),
                BlocBuilder<DDCharacterEditBloc, DDCharacterState>(builder: (_, characterListState) {
                  List<dynamic> _characters;
                  if (characterListState is DDCharactersListState){
                    _characters = characterListState.charactersList;
                    return _characterList(_characters, context);
                  }
                  else {
                    return _characterList([], context);
                  }

                })
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {Navigator.pushNamed(context, DDRoutes.GeneralInfo);},
            backgroundColor: DDTheme.accentColor,
            child: const Icon(Icons.add),
            splashColor: DDTheme.primaryColor,
          ),
        ),
    ));
  }
}
Widget _characterList(List<dynamic> _characters, BuildContext context) {
  return (_characters.length > 0)
      ?
  ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(
          left: 20, right: 20, top: 0, bottom: 20),
      itemCount: _characters.length,
      itemBuilder: (context, index) {
        return DDListButton(
          name: _characters[index].data()['name'],
          info: _characters[index].data()['race'],
          icon: DDKnightIcon,
          onPressed: () {
            context.read<DDCharacterEditBloc>().add(DDGetCharacterSheetEvent(context, _characters[index].id));

          },
        );
      }
  )
      :
  SizedBox(
    width: MediaQuery
        .of(context)
        .size
        .width,
    child: Text(
      "You don't have any saved characters yet",
      style: DDTextTheme.Raleway18WhiteRegular,
      textAlign: TextAlign.center,
    ),
  );
}

