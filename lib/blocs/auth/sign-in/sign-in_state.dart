import 'package:equatable/equatable.dart';

class DDSignInState extends Equatable {
  final String email;
  final String password;
  final bool valid;

  DDSignInState(this.email, this.password, this.valid);


  @override
  List<Object?> get props => [email, password, valid];
}
