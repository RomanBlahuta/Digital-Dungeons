import 'package:equatable/equatable.dart';

abstract class DDItemListState extends Equatable {

  @override
  List<Object?> get props => [];
}

class DDItemListLoadedState extends DDItemListState {
  final List<dynamic> spells;

  DDItemListLoadedState(this.spells);

  @override
  List<Object?> get props => [spells];
}

class DDItemListInitState extends DDItemListState{
  @override
  List<Object?> get props => [];
}
