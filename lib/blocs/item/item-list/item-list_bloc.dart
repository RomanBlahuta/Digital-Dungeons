import 'package:digitaldungeons/blocs/item/item-list/item-list_events.dart';
import 'package:digitaldungeons/blocs/item/item-list/item-list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repositories/index.dart';

class DDItemListBloc extends Bloc<DDItemListEvents, DDItemListState> {
  final DDApiRepository apiRepository = DDApiRepository();
  late List<dynamic> items;
  DDItemListBloc(): super(DDItemListInitState());

  @override
  Stream<DDItemListState> mapEventToState(DDItemListEvents event) async* {
    if (event == DDItemListEvents.fetchItems) {
      Map<String, dynamic> itemsMap = await apiRepository.fetchItems();
       items = itemsMap["results"];

       yield DDItemListLoadedState(items);
    }
  }
}
