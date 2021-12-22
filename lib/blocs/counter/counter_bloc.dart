import 'package:digitaldungeons/blocs/counter/counter_events.dart';
import 'package:digitaldungeons/blocs/counter/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc(): super(WelcomeState(0));

  @override
  Stream<WelcomeState> mapEventToState(WelcomeEvent event) async* {
    if (event is WelcomeIncrementEvent) {
      yield WelcomeState(state.value + 1);
    }
  }
}
