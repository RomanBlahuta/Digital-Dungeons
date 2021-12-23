import 'package:digitaldungeons/screens/home_screen.dart';
import 'package:digitaldungeons/utils/index.dart';
import 'package:digitaldungeons/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DDSignInScreen extends StatelessWidget {
  final String title;
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';

  DDSignInScreen(this.title);

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
                  height: 51,
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
                    text: 'SIGN IN',
                    color: DDTheme.primaryColor,
                    size: DDButtonSizes.Large,
                    type: DDButtonType.Filled,
                    textStyle: DDTextTheme.Raleway24BlackBold,
                    onPressed: () async {
                      try {
                        await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DDHomeScreen(),
                          ),
                        );

                      } on FirebaseAuthException catch (e) {
                        showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                            title: Text("Ops! Login Failed"),
                            content: Text('${e.message}'),
                            )
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
