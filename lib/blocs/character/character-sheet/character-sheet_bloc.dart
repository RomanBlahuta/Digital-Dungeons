import 'package:digitaldungeons/blocs/character/character-sheet/character-sheet_events.dart';
import 'package:digitaldungeons/blocs/character/character-sheet/character-sheet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DDCharacterSheetBloc extends Bloc<DDCharacterSheetEvent, DDCharacterSheetState> {
  // todo
  DDCharacterSheetBloc(): super(DDCharacterSheetState('CharacterSheetModel Here'));

  @override
  Stream<DDCharacterSheetState> mapEventToState(DDCharacterSheetEvent event) async* {
    if (event is DDCharacterSheetEvent) {
      yield state;
    }
  }
}
