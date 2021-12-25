import 'package:digitaldungeons/blocs/auth/sign-in/sign-in_events.dart';
import 'package:digitaldungeons/utils/index.dart';
import 'package:digitaldungeons/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth/sign-in/sign-in_bloc.dart';

class DDSignInScreen extends StatelessWidget {

  DDSignInScreen();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DDSignInBloc>(
      create: (providerContext) => DDSignInBloc(),
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
                        'Email',
                        textAlign: TextAlign.center,
                        style: DDTextTheme.Raleway20AccentRegular,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        //todo
                        context.read<DDSignInBloc>().add(DDSignInInputEvent(value.toString().trim(), DDSignInInputType.EMail));
                      },
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: DDTheme.primaryColor,
                        labelText: 'Enter your email',
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
                        style: DDTextTheme.Raleway20AccentRegular,
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
                        //todo
                        
                        context.read<DDSignInBloc>().add(DDSignInInputEvent(value, DDSignInInputType.Password));
                      },
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: DDTheme.primaryColor,
                        labelText: 'Enter your password',
                      ),
                    ),
                    SizedBox(
                      height: 51,
                    ),
                    DDButton(
                        text: 'SIGN IN',
                        color: DDTheme.accentColor,
                        size: DDButtonSizes.Large,
                        type: DDButtonType.Filled,
                        textStyle: DDTextTheme.Raleway24BlackBold,
                        onPressed: () async {
                          //todo
                            context.read<DDSignInBloc>().add(DDSignInSubmitEvent(context));  
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
