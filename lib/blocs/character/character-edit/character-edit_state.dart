import 'package:cloud_firestore/cloud_firestore.dart';
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

class DDCharactersListState extends DDCharacterState {

  final List<QueryDocumentSnapshot<Map<String, dynamic>>> charactersList;
  DDCharactersListState(this.charactersList);

  @override
  List<Object?> get props => [charactersList];
}

