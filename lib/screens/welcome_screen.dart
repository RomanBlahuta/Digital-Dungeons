import 'package:digitaldungeons/utils/index.dart';
import 'package:digitaldungeons/widgets/button.dart';
import 'package:flutter/material.dart';

class DDWelcomeScreen extends StatelessWidget {
  final String title;

  DDWelcomeScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Center(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/DD_banner.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ),

            Center(
              child: Container(
                color: DDTheme.overlayColor,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/DD_logo.png',
                    width: 309,
                  ),
                  SizedBox(
                    height: 51,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'WELCOME TO DIGITAL DUNGEONS!',
                      textAlign: TextAlign.center,
                      style: DDTextTheme.Raleway36PrimaryBold,
                    ),
                  ),
                  SizedBox(
                    height: 167,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DDButton(
                        text: 'SIGN IN', 
                        color: DDTheme.primaryColor, 
                        onPressed: () {Navigator.pushNamed(context, DDRoutes.SignIn);}, 
                        size: DDButtonSizes.Large, 
                        type: DDButtonType.Outlined,
                        textStyle: DDTextTheme.Raleway24PrimaryBold,
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      DDButton(
                        text: 'SIGN UP', 
                        color: DDTheme.primaryColor, 
                        onPressed: () {Navigator.pushNamed(context, DDRoutes.SignUp);}, 
                        size: DDButtonSizes.Large, 
                        type: DDButtonType.Filled,
                        textStyle: DDTextTheme.Raleway24BlackBold,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );
  }
}
