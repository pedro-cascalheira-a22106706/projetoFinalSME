import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  final _fire = FirebaseFirestore.instance;

  saveUser(Map<String, dynamic> userData) async{
    try{
      await _fire.collection("users").doc(userData["uid"]).set(userData);

      log("User saved successfully!");
    }catch(e){
      rethrow;
    }
  }
  Future<Map<String, dynamic>?> loadUser(String uid) async{
    try{
      final response = await _fire.collection("users").doc(uid).get();

      if(response.data() != null){
        log("User loaded successfully!");
        return response.data();
      }
    }catch(e){
      rethrow;
    }
    return null;
  }
}