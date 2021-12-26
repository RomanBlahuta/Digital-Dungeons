import 'package:equatable/equatable.dart';

abstract class DDSpellListState extends Equatable {

  @override
  List<Object?> get props => [];
}

class DDSpellListLoadedState extends DDSpellListState {
  final List<dynamic> spells;

  DDSpellListLoadedState(this.spells);

  @override
  List<Object?> get props => [spells];
}

class DDSpellListInitState extends DDSpellListState{
  @override
  List<Object?> get props => [];
}