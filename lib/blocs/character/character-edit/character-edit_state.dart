import 'package:equatable/equatable.dart';

abstract class DDCharacterState extends Equatable {
  @override
  List<Object?> get props => [];
}
class DDCharacterInitState extends DDCharacterState {
  DDCharacterInitState();
}

class DDCharacterDataState extends DDCharacterState {

  final Map<String, String> characterData;
  DDCharacterDataState(this.characterData);

  @override
  List<Object?> get props => [characterData];
}

// // todo: add more
//
// class DDCharacterEquipmentState extends DDCharacterState {
//   final String money;
//   final String equipment;
//
//   DDCharacterEquipmentState(this.money, this.equipment);
//
//   @override
//   List<Object?> get props => [money, equipment];
// }
