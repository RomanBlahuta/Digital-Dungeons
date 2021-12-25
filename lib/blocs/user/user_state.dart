import 'package:equatable/equatable.dart';

class DDUserState extends Equatable {
  // todo: Enter model type here instead of dynamic
  final dynamic userModel;

  DDUserState(this.userModel);


  @override
  List<Object?> get props => [/* todo: model properties here */];
}
