import 'package:digitaldungeons/blocs/item/item-list/item-list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/item/item-list/item-list_events.dart';
import '../blocs/item/item-list/item-list_state.dart';
import '../utils/index.dart';
import '../widgets/index.dart';

class DDItemListScreen extends StatelessWidget {
  static const List<Map> _items = [
    {'name' : 'Dagger of Venom', 'info' : 'melee weapon (simple, dagger)'},
    {'name' : 'Dagger of Venom', 'info' : 'melee weapon (simple, dagger)'},
    {'name' : 'Dagger of Venom', 'info' : 'melee weapon (simple, dagger)'},
    {'name' : 'Dagger of Venom', 'info' : 'melee weapon (simple, dagger)'},
    {'name' : 'Dagger of Venom', 'info' : 'melee weapon (simple, dagger)'},
  ];

  const DDItemListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DDItemListBloc>(
      create: (providerContext) => DDItemListBloc()..add(DDItemListEvents.fetchItems),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: DDTheme.darkColor,
          appBar: DDAppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                DDCategoryHeader(
                  text: "ITEMS",
                  icon: DDSwordIcon,
                  background: DDItemListBanner,
                ),
                SizedBox(height: 20,),
                BlocBuilder<DDItemListBloc, DDItemListState>(builder: (_, itemListState) {
                  List<dynamic> _items;
                  if (itemListState is DDItemListLoadedState){
                    _items = itemListState.spells;
                    return _itemList(_items);
                  }
                  else {
                    return _itemList([]);
                  }

                })
              ],
            ),
          ),
        )
      ),
    );
  }

  Widget _itemList(List<dynamic> _items) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 20),
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return DDListButton(
          name: _items[index]['name'],
          onPressed: () {Navigator.pushNamed(context, DDRoutes.ItemSheet);},
        );
      }
  );
  }
}
