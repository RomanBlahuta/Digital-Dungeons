import 'package:digitaldungeons/utils/index.dart';
import 'package:flutter/material.dart';

class DDCategoryButton extends StatelessWidget {
  final String background;
  final String icon;
  final String text;
  final void Function() onPressed;

  DDCategoryButton({Key? key, required this.text, required this.onPressed, required this.icon, required this.background}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          width: 340,
          height: 319,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(background),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4))
          ),
          child: Padding (
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage(icon),
                  height: 133,
                  width: 133,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(text, style: DDTextTheme.Raleway30WhiteBold,)
              ],
            ),
            padding: EdgeInsets.only(top: 40, left: 20),
          )
      ),
    );
  }
}