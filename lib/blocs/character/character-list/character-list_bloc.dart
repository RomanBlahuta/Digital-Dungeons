import 'package:digitaldungeons/blocs/character/character-list/character-list_events.dart';
import 'package:digitaldungeons/blocs/character/character-list/character-list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DDCharacterListBloc extends Bloc<DDCharacterListEvent, DDCharacterListState> {
  // todo
  DDCharacterListBloc(): super(DDCharacterListState('CharacterListModel Here'));

  @override
  Stream<DDCharacterListState> mapEventToState(DDCharacterListEvent event) async* {
    if (event is DDCharacterListEvent) {
      yield state;
    }
  }
}
