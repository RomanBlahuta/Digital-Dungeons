import 'package:equatable/equatable.dart';

enum DDSignInInputType {
  EMail,
  Password,
}

abstract class DDSignInEvent extends Equatable{}

class DDSignInSubmitEvent extends DDSignInEvent {
  @override
  List<Object?> get props => [];
}

class DDSignInInputEvent extends DDSignInEvent {
  final String textValue;
  final DDSignInInputType inputType;

  DDSignInInputEvent(this.textValue, this.inputType);

  @override
  List<Object?> get props => [textValue, inputType];
}
