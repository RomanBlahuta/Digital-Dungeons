import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digitaldungeons/blocs/character/character-edit/character-edit_events.dart';
import 'package:digitaldungeons/blocs/character/character-edit/character-edit_state.dart';
import 'package:digitaldungeons/models/character_data.dart';
import 'package:digitaldungeons/repositories/database_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:digitaldungeons/utils/index.dart';
import 'package:digitaldungeons/screens/character-sheet_screen.dart';
import 'dart:developer';

class DDCharacterEditBloc extends Bloc<DDCharacterEvent, DDCharacterState> {

  Character character = Character();
  Map<String, String> characterData = Map<String, String>();
  String documentId = "";
  final DDDatabaseRepository databaseRepository = DDDatabaseRepository();

  DDCharacterEditBloc(): super(DDCharacterDataState(Map<String, String>()));

  @override
  Stream<DDCharacterState> mapEventToState(DDCharacterEvent event) async* {
    if (event is DDEditCharacterFieldEvent) {
        characterData[event.inputType] = event.textValue;
        yield DDCharacterDataState(characterData);
    }
    else if (event is DDEditPrevCharacterFieldEvent) {
      characterData = event.characterData;
      characterData["edit"] = "1";
      yield DDCharacterDataState(characterData);
    }
    else if (event is DDDeleteCharacterEvent) {
      characterData = event.characterData;
      databaseRepository.deleteCharacter(characterData);
      yield DDCharacterDataState(characterData);
    }
    
    else if (event is DDSwitchCharacterTabEvent) {
        yield DDCharacterDataState(characterData);
    }
     else if (event is DDAddNewCharacterTabEvent) {
        databaseRepository.saveNewCharacter(characterData);
        Navigator.pushNamed(event.context, DDRoutes.CharactersList);
        yield DDCharacterDataState(characterData);
    }
    else if (event is DDEditCharacterTabEvent) {
      databaseRepository.editCharacter(characterData);
      Navigator.pushNamed(event.context, DDRoutes.CharactersList);
      yield DDCharacterDataState(characterData);
    }
    else if (event is DDGetCharactersEvent) {
      QuerySnapshot<Map<String, dynamic>> charactersListQuery = await databaseRepository.getCharacters();
      List<QueryDocumentSnapshot<Map<String, dynamic>>> charactersList = charactersListQuery.docs;
      yield DDCharactersListState(charactersList);
    }
    else if (event is DDClearCharacterDataEvent) {
      characterData = Map<String, String>();
      yield DDCharacterDataState(new Map<String, String>());
    }
    else if (event is DDGetCharacterSheetEvent) {
      DocumentSnapshot<Map<String, dynamic>> futureCharacterData = await databaseRepository.getCharacter(event.documentId);
      documentId = event.documentId;

      Map<String, dynamic> characterMapDynamic = futureCharacterData.data() as Map<String, dynamic>;
      Map<String, String> characterMap = characterMapDynamic.map((key, value) => MapEntry(key, value.toString()));
      characterMap["documentId"] = documentId;
      Navigator.of(event.context).push(MaterialPageRoute(builder: (ctx) {
        return DDCharacterSheetScreen(characterData: characterMap);
      }
      ));
      yield DDCharacterDataState(characterMap);
    }
  }
}
