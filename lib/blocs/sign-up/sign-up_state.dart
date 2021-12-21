import 'package:equatable/equatable.dart';

class DDSignUpState extends Equatable {
  final String email;
  final String password;
  final String name;
  final bool valid;

  DDSignUpState(this.email, this.password, this.name, this.valid);


  @override
  List<Object?> get props => [email, password, name, valid];
}
