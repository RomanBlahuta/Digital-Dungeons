import 'package:digitaldungeons/blocs/spell/spell-list/spell-list_events.dart';
import 'package:digitaldungeons/blocs/spell/spell-list/spell-list_state.dart';
import 'package:digitaldungeons/repositories/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';

class DDSpellListBloc extends Bloc<DDSpellListEvents, DDSpellListState> {
  final DDApiRepository apiRepository = DDApiRepository();
  late List<dynamic> spells;
  DDSpellListBloc(): super(DDSpellListInitState());

  @override
  Stream<DDSpellListState> mapEventToState(DDSpellListEvents event) async* {
    if (event == DDSpellListEvents.fetchSpells) {
       Map<String, dynamic> spellsMap = await apiRepository.fetchSpells();
       spells = spellsMap["results"];

       yield DDSpellListLoadedState(spells);
    }
  }
}
