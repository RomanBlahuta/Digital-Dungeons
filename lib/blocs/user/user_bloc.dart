import 'package:digitaldungeons/blocs/user/user_events.dart';
import 'package:digitaldungeons/blocs/user/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DDUserBloc extends Bloc<DDUserEvent, DDUserState> {
  // todo
  DDUserBloc(): super(DDUserState('UserModel Here'));

  @override
  Stream<DDUserState> mapEventToState(DDUserEvent event) async* {
    if (event is DDUserEvent) {
      yield state;
    }
  }
}
