import 'package:digitaldungeons/blocs/auth/sign-up/sign-up_events.dart';
import 'package:digitaldungeons/blocs/auth/sign-up/sign-up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DDSignUpBloc extends Bloc<DDSignUpEvent, DDSignUpState> {
  DDSignUpBloc(): super(DDSignUpState('', '', '', false));

  @override
  Stream<DDSignUpState> mapEventToState(DDSignUpEvent event) async* {
    if (event is DDSignUpSubmitEvent) {
      // send request if valid, else pop-up or error msg
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
