import 'package:equatable/equatable.dart';

enum DDSignUpInputType {
  EMail,
  Password,
  Name,
}

abstract class DDSignUpEvent extends Equatable{}

class DDSignUpSubmitEvent extends DDSignUpEvent {
  @override
  List<Object?> get props => [];
}

class DDSignUpInputEvent extends DDSignUpEvent {
  final String textValue;
  final DDSignUpInputType inputType;

  DDSignUpInputEvent(this.textValue, this.inputType);

  @override
  List<Object?> get props => [textValue, inputType];
}
