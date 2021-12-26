import 'package:flutter/material.dart';
import "package:digitaldungeons/repositories/auth_repository.dart";
import '../utils/index.dart';

class DDAppBar extends StatelessWidget implements PreferredSizeWidget {

  const DDAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {Navigator.pushNamed(context, DDRoutes.Home);},
          icon: const Icon(
            Icons.home,
            color: DDTheme.darkColor,
            size: 35,
          )
      ),
      title: Text("DIGITAL DUNGEONS",
        style: DDTextTheme.Raleway20BlackSemiBold,),
      actions: <Widget> [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, DDRoutes.Welcome);
              DDAuthRepository authRepository = DDAuthRepository();
              authRepository.signOut();
              },
            icon: const Icon(
              Icons.logout,
              color: DDTheme.darkColor,
              size: 35,
            )
        )
      ],
      backgroundColor: DDTheme.primaryColor,
    );
  }
}
