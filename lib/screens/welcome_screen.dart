import 'package:digitaldungeons/utils/index.dart';
import 'package:digitaldungeons/widgets/index.dart';
import 'package:flutter/material.dart';

class DDWelcomeScreen extends StatelessWidget {

  DDWelcomeScreen();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(DDBanner),
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
                      DDLogo,
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
                          onPressed: () {Navigator.pushNamed(context, DDRoutes.Home);}, 
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
        ),
      );
  }
}
