import 'package:flutter/material.dart';

import '../utils/index.dart';

class DDSwitchPagesController extends StatelessWidget {
  final String? leftRoute;
  final String? rightRoute;


  const DDSwitchPagesController({Key? key, this.leftRoute, this.rightRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        (leftRoute != null)
          ?
        Align(
          alignment: Alignment.bottomLeft,
          child: IconButton(
            iconSize: 77,
            icon: Image.asset(DDArrowLeftIcon),
            onPressed: () {
              // print(_alignmentController.text);
              Navigator.pushNamed(context, leftRoute!);
            },
          ),
        )
          :
        SizedBox()
        ,
        (rightRoute != null)
            ?
        Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
              iconSize: 77,
              icon: Image.asset(DDArrowIcon),
              onPressed: () {
                // print(_alignmentController.text);
                Navigator.pushNamed(context, rightRoute!);
              }
          ),
        )
            :
        SizedBox()
        ,
      ],
    );
  }
}
