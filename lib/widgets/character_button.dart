import 'package:flutter/material.dart';
import '../utils/index.dart';

class DDCharacterButton extends StatelessWidget {
  final String name;
  final String info;
  final String icon;

  const DDCharacterButton({Key? key, required this.name, required this.info, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 340,
      height: 87,
      decoration: BoxDecoration(
        color: DDTheme.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child:  InkWell(
        onTap: () {},
        splashColor: DDTheme.accentColor,
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              backgroundColor: DDTheme.darkColor,
              radius: 42,
              backgroundImage: AssetImage(icon),
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name, style: DDTextTheme.Raleway24BlackBold,),
                Text(info, style: DDTextTheme.Raleway20BlackRegular,)
              ],
            )
          ],
        ),
      ),
    );
  }
}