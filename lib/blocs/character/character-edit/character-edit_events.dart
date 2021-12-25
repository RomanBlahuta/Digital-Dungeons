import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum DDCharacterInputType {
  Name,
  Player,
  Level,
  Class,
  Race,
  Background,
  // Experience,
  // Initiative,
  // Armor,
  // Speed,
  // Hit_Dice,
  // Death_Saves,
}

abstract class DDCharacterEvent extends Equatable{}

class DDSwitchCharacterTabEvent extends DDCharacterEvent {
  final BuildContext context;

  DDSwitchCharacterTabEvent(this.context);

  @override
  List<Object?> get props => [context];
}

class DDSaveCharacterTabEvent extends DDCharacterEvent {
  final BuildContext context;

  DDSaveCharacterTabEvent(this.context);

  @override
  List<Object?> get props => [context];
}

class DDAddNewCharacterTabEvent extends DDCharacterEvent {
  final BuildContext context;

  DDAddNewCharacterTabEvent(this.context);

  @override
  List<Object?> get props => [context];
}

class DDEditCharacterFieldEvent extends DDCharacterEvent {
  final String textValue;
  final String inputType;

  DDEditCharacterFieldEvent(this.textValue, this.inputType);

  @override
  List<Object?> get props => [textValue, inputType];
}
