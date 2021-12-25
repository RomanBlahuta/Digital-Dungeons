import 'package:digitaldungeons/utils/index.dart';
import 'package:digitaldungeons/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:digitaldungeons/repositories/auth_repository.dart';

class DDSignUpScreen extends StatelessWidget {
  final String title;
  final _auth = DDAuthRepository();
  String name = '';
  String email = '';
  String password = '';

  DDSignUpScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                  height: 25,
                ),
                Image.asset(
                  'assets/images/DD_logo.png',
                  width: 156,
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Name',
                    textAlign: TextAlign.center,
                    style: DDTextTheme.Raleway20AccentRegular,
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    name = value.toString().trim();
                  },
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: DDTheme.primaryColor,
                    labelText: 'Enter your name',
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
                    style: DDTextTheme.Raleway20AccentRegular,
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value.toString().trim();
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
                    password = value;
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
                  text: 'SIGN UP',
                  color: DDTheme.primaryColor,
                  size: DDButtonSizes.Large,
                  type: DDButtonType.Filled,
                  textStyle: DDTextTheme.Raleway24BlackBold,
                  onPressed: () async {
                    try {
                      await _auth.signUp(email, password);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.blueGrey,
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Sucessfully Register.You Can Login Now'),
                          ),
                          duration: Duration(seconds: 5),
                        ),
                      );
                      Navigator.of(context).pop();
                    } on FirebaseAuthException catch (e) {
                      showDialog(
                        context: context,
                        builder: (ctx) =>
                            AlertDialog(
                              title:
                              Text(' Ops! Registration Failed'),
                              content: Text('${e.message}'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Text('Okay'),
                                )
                              ],
                            ),
                      );
                    }
                  }
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
