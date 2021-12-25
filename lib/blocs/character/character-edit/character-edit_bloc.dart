import 'package:digitaldungeons/blocs/character/character-edit/character-edit_events.dart';
import 'package:digitaldungeons/blocs/character/character-edit/character-edit_state.dart';
import 'package:digitaldungeons/models/character_data.dart';
import 'package:digitaldungeons/repositories/database_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:digitaldungeons/utils/index.dart';

class DDCharacterEditBloc extends Bloc<DDCharacterEvent, DDCharacterState> {

  Character character = Character();
  Map<String, String> characterData = Map<String, String>();
  final DDDatabaseRepository databaseRepository = DDDatabaseRepository();

  DDCharacterEditBloc(): super(DDCharacterDataState(Map<String, String>()));

  @override
  Stream<DDCharacterState> mapEventToState(DDCharacterEvent event) async* {
    if (event is DDEditCharacterFieldEvent) {
        characterData[event.inputType] = event.textValue;
        yield DDCharacterDataState(characterData);
    }
    else if (event is DDSwitchCharacterTabEvent) {
        yield DDCharacterDataState(characterData);
    }
     else if (event is DDAddNewCharacterTabEvent) {
        databaseRepository.saveNewCharacter(characterData);
        Navigator.pushNamed(event.context, DDRoutes.CharactersList);;
        yield DDCharacterDataState(characterData);
    }
  }
}
