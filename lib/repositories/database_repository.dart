import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digitaldungeons/models/character_data.dart';
import 'package:digitaldungeons/repositories/auth_repository.dart';

class DDDatabaseRepository {
  final firestoreInstance = FirebaseFirestore.instance;

  void saveNewCharacter(Map<String, String> characterData) {
    var currentUser =  DDAuthRepository.getCurrentUser();
    firestoreInstance.collection("users").doc(currentUser?.uid).collection("characters").add(characterData);
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getCharacters() {
    var currentUser =  DDAuthRepository.getCurrentUser();
    return firestoreInstance.collection("users").doc(currentUser?.uid).collection("characters").get();
  }
}
