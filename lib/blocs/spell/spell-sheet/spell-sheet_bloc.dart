import 'package:digitaldungeons/blocs/spell/spell-sheet/spell-sheet_events.dart';
import 'package:digitaldungeons/blocs/spell/spell-sheet/spell-sheet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DDSpellSheetBloc extends Bloc<DDSpellSheetEvent, DDSpellSheetState> {
  // todo
  DDSpellSheetBloc(): super(DDSpellSheetState('SpellSheetModel Here'));

  @override
  Stream<DDSpellSheetState> mapEventToState(DDSpellSheetEvent event) async* {
    if (event is DDSpellSheetEvent) {
      yield state;
    }
  }
}
