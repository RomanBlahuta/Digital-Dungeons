import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum DDSignUpInputType {
  EMail,
  Password,
  Name,
}

abstract class DDSignUpEvent extends Equatable{}

class DDSignUpSubmitEvent extends DDSignUpEvent {
  final BuildContext context;

  DDSignUpSubmitEvent(this.context);

  @override
  List<Object?> get props => [context];
}

class DDSignUpInputEvent extends DDSignUpEvent {
  final String textValue;
  final DDSignUpInputType inputType;

  DDSignUpInputEvent(this.textValue, this.inputType);

  @override
  List<Object?> get props => [textValue, inputType];
}
