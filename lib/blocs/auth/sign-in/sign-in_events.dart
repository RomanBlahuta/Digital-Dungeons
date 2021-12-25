import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

enum DDSignInInputType {
  EMail,
  Password,
}

abstract class DDSignInEvent extends Equatable {}

class DDSignInSubmitEvent extends DDSignInEvent {
  final BuildContext context;

  DDSignInSubmitEvent(this.context);

  @override
  List<Object?> get props => [context];
}

class DDSignInInputEvent extends DDSignInEvent {
  final String textValue;
  final DDSignInInputType inputType;

  DDSignInInputEvent(this.textValue, this.inputType);

  @override
  List<Object?> get props => [textValue, inputType];
}
