import 'package:digitaldungeons/blocs/spell/spell-list/spell-list_events.dart';
import 'package:digitaldungeons/blocs/spell/spell-list/spell-list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DDSpellListBloc extends Bloc<DDSpellListEvent, DDSpellListState> {
  // todo
  DDSpellListBloc(): super(DDSpellListState('SpellListModel Here'));

  @override
  Stream<DDSpellListState> mapEventToState(DDSpellListEvent event) async* {
    if (event is DDSpellListEvent) {
      yield state;
    }
  }
}
