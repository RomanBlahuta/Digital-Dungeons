import 'package:digitaldungeons/blocs/auth/sign-up/sign-up_bloc.dart';
import 'package:digitaldungeons/utils/index.dart';
import 'package:digitaldungeons/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/auth/sign-up/sign-up_events.dart';

class DDSignUpScreen extends StatelessWidget {

  DDSignUpScreen();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DDSignUpBloc>(
      create: (providerContext) => DDSignUpBloc(),
      child: Scaffold(
        body: Builder(
          builder: (context) => Stack(
            children: <Widget>[
              Center(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/DD_banner_signin.png'),
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

              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      'assets/images/DD_logo.png',
                      width: 156,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Name',
                        textAlign: TextAlign.center,
                        style: DDTextTheme.Raleway20AccentBold,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        context.read<DDSignUpBloc>().add(DDSignUpInputEvent(value.toString().trim(), DDSignUpInputType.Name));
                      },
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: DDTheme.accentColor),
                        ),
                        filled: true,
                        fillColor: DDTheme.primaryColor,
                        labelText: 'Enter your name',
                        labelStyle: TextStyle(color: DDTheme.darkColor),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Email',
                        textAlign: TextAlign.center,
                        style: DDTextTheme.Raleway20AccentBold,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        context.read<DDSignUpBloc>().add(DDSignUpInputEvent(value.toString().trim(), DDSignUpInputType.EMail));
                      },
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: DDTheme.accentColor),
                        ),
                        filled: true,
                        fillColor: DDTheme.primaryColor,
                        labelText: 'Enter your email',
                        labelStyle: TextStyle(color: DDTheme.darkColor),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Password',
                        textAlign: TextAlign.center,
                        style: DDTextTheme.Raleway20AccentBold,
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter Password";
                        }
                      },
                      onChanged: (value) {
                        context.read<DDSignUpBloc>().add(DDSignUpInputEvent(value, DDSignUpInputType.Password));
                      },
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: DDTheme.accentColor),
                        ),
                        filled: true,
                        fillColor: DDTheme.primaryColor,
                        labelText: 'Enter your password',
                        labelStyle: TextStyle(color: DDTheme.darkColor),
                      ),
                    ),
                    SizedBox(
                      height: 51,
                    ),
                    DDButton(
                      text: 'SIGN UP',
                      color: DDTheme.accentColor,
                      size: DDButtonSizes.Large,
                      type: DDButtonType.Filled,
                      textStyle: DDTextTheme.Raleway24BlackBold,
                      onPressed: () async {
                        context.read<DDSignUpBloc>().add(DDSignUpSubmitEvent(context));
                      }
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
