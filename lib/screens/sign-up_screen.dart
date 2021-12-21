import 'package:digitaldungeons/blocs/sign-up/sign-up_bloc.dart';
import 'package:digitaldungeons/utils/index.dart';
import 'package:digitaldungeons/utils/theme.dart';
import 'package:digitaldungeons/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DDSignUpScreen extends StatelessWidget {
  const DDSignUpScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext topContext) {
    return BlocProvider<DDSignUpBloc>(
      create: (providerContext) => DDSignUpBloc(),
      child: SafeArea(
        child: Scaffold(
          body: Builder(
            builder: (context) => Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height - 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/DD_auth_background.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(44),
                  child: Image.asset(
                    'assets/images/DD_logo.png',
                    width: 156,
                    height: 74,
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 222,
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: DDTheme.darkColor,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 90,
                            ),
                            Text(
                              ''
                            )
                          ],
                        )
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}