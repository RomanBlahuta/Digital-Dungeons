import 'package:digitaldungeons/blocs/auth/sign-in/sign-in_events.dart';
import 'package:digitaldungeons/blocs/auth/sign-in/sign-in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DDSignInBloc extends Bloc<DDSignInEvent, DDSignInState> {
  DDSignInBloc(): super(DDSignInState('', '', false));

  @override
  Stream<DDSignInState> mapEventToState(DDSignInEvent event) async* {
    if (event is DDSignInSubmitEvent) {
      // send request if valid, else pop-up or error msg
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
