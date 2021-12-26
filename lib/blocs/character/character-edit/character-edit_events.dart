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

class DDEditPrevCharacterFieldEvent  extends DDCharacterEvent {
  final Map<String, String> characterData;
  DDEditPrevCharacterFieldEvent(this.characterData);
  @override
  List<Object?> get props => [characterData];
}

class DDDeleteCharacterEvent  extends DDCharacterEvent {
  final Map<String, String> characterData;
  DDDeleteCharacterEvent(this.characterData);
  @override
  List<Object?> get props => [characterData];
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

class DDEditCharacterTabEvent extends DDCharacterEvent {
  final BuildContext context;

  DDEditCharacterTabEvent(this.context);

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

class DDGetCharactersEvent extends DDCharacterEvent {
  DDGetCharactersEvent();
  @override
  List<Object?> get props => [];
}

class DDClearCharacterDataEvent extends DDCharacterEvent {
  DDClearCharacterDataEvent();
  @override
  List<Object?> get props => [];
}

class DDGetCharacterSheetEvent extends DDCharacterEvent {
  final BuildContext context;
  final String documentId;
  DDGetCharacterSheetEvent(this.context, this.documentId);
  @override
  List<Object?> get props => [documentId];
}
