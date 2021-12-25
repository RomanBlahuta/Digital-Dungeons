import 'package:digitaldungeons/blocs/auth/sign-up/sign-up_events.dart';
import 'package:digitaldungeons/blocs/auth/sign-up/sign-up_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repositories/index.dart';

class DDSignUpBloc extends Bloc<DDSignUpEvent, DDSignUpState> {
  DDSignUpBloc(): super(DDSignUpState('', '', '', false));
  final _auth = DDAuthRepository();

  @override
  Stream<DDSignUpState> mapEventToState(DDSignUpEvent event) async* {
    if (event is DDSignUpSubmitEvent) {
      // send request if valid, else pop-up or error msg
      try {
        await _auth.signUp(state.email, state.password);
        ScaffoldMessenger.of(event.context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.blueGrey,
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Sucessfully Registered.You Can Login Now'),
            ),
            duration: Duration(seconds: 5),
          ),
        );
        Navigator.of(event.context).pop();
      } on FirebaseAuthException catch (e) {
        showDialog(
          context: event.context,
          builder: (ctx) =>
              AlertDialog(
                title:
                Text(' Oops! Registration Failed'),
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
      
      yield state;
    }
    else if (event is DDSignUpInputEvent) {
      switch (event.inputType) {
        case DDSignUpInputType.EMail:
          // validate form
          yield DDSignUpState(event.textValue, state.password, state.name, state.valid);
          break;
        case DDSignUpInputType.Password:
          // validate form
          yield DDSignUpState(state.email, event.textValue, state.name, state.valid);
          break;
        case DDSignUpInputType.Name:
          // validate form
          yield DDSignUpState(state.email, state.password, event.textValue, state.valid);
          break;
        default:
        yield state;
      }
    }
  }
}
