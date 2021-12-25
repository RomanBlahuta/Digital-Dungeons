import 'package:digitaldungeons/blocs/character/character-edit/character-edit_events.dart';
import 'package:digitaldungeons/blocs/character/character-edit/character-edit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DDCharacterEditBloc extends Bloc<DDCharacterEditEvent, DDCharacterEditState> {
  // todo
  DDCharacterEditBloc(): super(DDCharacterEditState('CharacterEditModel Here'));

  @override
  Stream<DDCharacterEditState> mapEventToState(DDCharacterEditEvent event) async* {
    if (event is DDCharacterEditEvent) {
      yield state;
    }
  }
}
