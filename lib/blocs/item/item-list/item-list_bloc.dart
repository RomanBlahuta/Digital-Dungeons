import 'package:digitaldungeons/blocs/item/item-list/item-list_events.dart';
import 'package:digitaldungeons/blocs/item/item-list/item-list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DDItemListBloc extends Bloc<DDItemListEvent, DDItemListState> {
  // todo
  DDItemListBloc(): super(DDItemListState('ItemListModel Here'));

  @override
  Stream<DDItemListState> mapEventToState(DDItemListEvent event) async* {
    if (event is DDItemListEvent) {
      yield state;
    }
  }
}
