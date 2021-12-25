import 'package:digitaldungeons/blocs/auth/sign-in/sign-in_events.dart';
import 'package:digitaldungeons/blocs/auth/sign-in/sign-in_state.dart';
import 'package:digitaldungeons/utils/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:digitaldungeons/repositories/index.dart';

class DDSignInBloc extends Bloc<DDSignInEvent, DDSignInState> {
  DDSignInBloc(): super(DDSignInState('', '', false));
  final _auth = DDAuthRepository();

  

  @override
  Stream<DDSignInState> mapEventToState(DDSignInEvent event) async* {
    if (event is DDSignInSubmitEvent) {
      // send request if valid, else pop-up or error msg
      try {
        await _auth.signIn(state.email, state.password);
        await Navigator.of(event.context).pushNamed(
          DDRoutes.Home,
        );

      } on FirebaseAuthException catch (e) {
        showDialog(
            context: event.context,
            builder: (ctx) => AlertDialog(
            title: Text("Oops! Login Failed"),
            content: Text('${e.message}'),
            )
        );
      }
      yield state;
    }
    else if (event is DDSignInInputEvent) {
      switch (event.inputType) {
        case DDSignInInputType.EMail:
          // validate form
          yield DDSignInState(event.textValue, state.password, state.valid);
          break;
        case DDSignInInputType.Password:
          // validate form
          yield DDSignInState(state.email, event.textValue, state.valid);
          break;
        default:
        yield state;
      }
    }
  }
}
