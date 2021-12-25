import 'package:digitaldungeons/repositories/repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DDAuthRepository extends Repository {
  final _auth = FirebaseAuth.instance;
  DDAuthRepository(): super();

  Future<UserCredential> signUp(String email, String password) {
    return _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> signIn(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  static User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }
}
