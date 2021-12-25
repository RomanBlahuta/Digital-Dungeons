import 'package:digitaldungeons/blocs/item/item-sheet/item-sheet_events.dart';
import 'package:digitaldungeons/blocs/item/item-sheet/item-sheet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DDItemSheetBloc extends Bloc<DDItemSheetEvent, DDItemSheetState> {
  // todo
  DDItemSheetBloc(): super(DDItemSheetState('ItemSheetModel Here'));

  @override
  Stream<DDItemSheetState> mapEventToState(DDItemSheetEvent event) async* {
    if (event is DDItemSheetEvent) {
      yield state;
    }
  }
}
