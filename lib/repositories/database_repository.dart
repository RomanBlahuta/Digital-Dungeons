import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digitaldungeons/models/character_data.dart';
import 'package:digitaldungeons/repositories/auth_repository.dart';
import 'dart:developer';

class DDDatabaseRepository {
  final firestoreInstance = FirebaseFirestore.instance;

  void saveNewCharacter(Map<String, String> characterData) {
    var currentUser =  DDAuthRepository.getCurrentUser();
    firestoreInstance.collection("users").doc(currentUser?.uid).collection("characters").add(characterData);
  }

  void editCharacter(Map<String, String> characterData) {
    var currentUser =  DDAuthRepository.getCurrentUser();
    firestoreInstance.collection("users").doc(currentUser?.uid).collection("characters").doc(characterData["documentId"]).update(characterData);
  }

  void deleteCharacter(Map<String, String> characterData) {
    var currentUser =  DDAuthRepository.getCurrentUser();
    firestoreInstance.collection("users").doc(currentUser?.uid).collection("characters").doc(characterData["documentId"]).delete();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getCharacters() {
    var currentUser =  DDAuthRepository.getCurrentUser();
    return firestoreInstance.collection("users").doc(currentUser?.uid).collection("characters").get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getCharacter(documentId) {
    var currentUser =  DDAuthRepository.getCurrentUser();
    return firestoreInstance.collection("users").doc(currentUser?.uid).collection("characters").doc(documentId).get();
  }
}
