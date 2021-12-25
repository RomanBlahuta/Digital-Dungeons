import 'package:flutter/material.dart';
import '../utils/index.dart';

class DDListButton extends StatelessWidget {
  final String name;
  final String info;
  final String? icon;
  final void Function() onPressed;

  const DDListButton({Key? key, required this.name, this.info="", this.icon, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Ink(
        width: 340,
        height: 87,
        decoration: BoxDecoration(
          color: DDTheme.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child:  InkWell(
          onTap: onPressed,
          splashColor: DDTheme.accentColor,
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              (icon != null)
                  ?
              CircleAvatar(
                backgroundColor: DDTheme.darkColor,
                radius: 42,
                backgroundImage: AssetImage(icon!),
              )
                  :
              SizedBox(),
              SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name, style: DDTextTheme.Raleway24BlackSemiBold,),
                  SizedBox(height: 2,),
                  info != ""? Text(info, style: DDTextTheme.Raleway20BlackRegular,) : SizedBox.shrink()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}