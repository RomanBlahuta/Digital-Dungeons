import 'package:equatable/equatable.dart';

class WelcomeState extends Equatable {
  final int value;

  WelcomeState(this.value);


  @override
  List<Object?> get props => [value];
}
