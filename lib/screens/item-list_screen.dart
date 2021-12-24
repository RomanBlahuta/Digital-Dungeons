// import 'package:digitaldungeons/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import '../utils/index.dart';
import '../widgets/index.dart';
// import '../widgets/category_header.dart';
// import '../widgets/list_button.dart';

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
    return SafeArea(
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
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 20),
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      return DDListButton(
                        name: _items[index]['name'],
                        info: _items[index]['info'],
                        onPressed: () {Navigator.pushNamed(context, DDRoutes.ItemSheet);},
                      );
                    }
                ),
              ],
            ),
          ),
        )
    );
  }
}
