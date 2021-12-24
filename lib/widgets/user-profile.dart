import 'package:digitaldungeons/utils/index.dart';
import 'package:flutter/material.dart';

class DDUserProfile extends StatelessWidget {
  final String userName;
  final String userEmail;

  DDUserProfile({Key? key, required this.userName, required this.userEmail}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 164,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: DDTheme.accentColor,
            height: 104,
            width: double.infinity,
          ),
          Positioned (
              bottom: 20,
              left: 30,
              child: CircleAvatar(
                backgroundColor: DDTheme.darkColor,
                radius: 66,
                backgroundImage: AssetImage(DDUserLogo),
              )
          ),
          Positioned(
            bottom: 15,
            right: 20,
            child: Container(
              width: 200,
              margin: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Text(userName, style: DDTextTheme.Raleway24BlackBold,),
                  SizedBox(height: 10,),
                  Text(userEmail, style: DDTextTheme.Raleway20BlackRegular,)
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}