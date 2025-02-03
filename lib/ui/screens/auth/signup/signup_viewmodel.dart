
import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_final/core/models/user_model.dart';
import 'package:projeto_final/core/other/base_viewmodel.dart';
import 'package:projeto_final/core/services/auth_service.dart';
import 'package:projeto_final/core/services/db_service.dart';
import 'package:projeto_final/core/services/storage_service.dart';

class SignupViewmodel extends BaseViewModel{
  SignupViewmodel(
      this._auth,
      this._db,
  );

  final _picker = ImagePicker();

  final AuthService _auth;
  final DataBaseService _db;

  String _name='',_email='', _password='', _confirmPassword='';
  File? _image;

  File? get image => _image;

  pickImage() async{
    log("Pick image");
    final pic = await _picker.pickImage(source: ImageSource.gallery);
    if(pic !=null){
      _image = File(pic.path);
      notifyListeners();
    }
  }
  void setName(String name){
    _name = name;
    notifyListeners();

    log("Email: $name");
  }
  void setEmail(String email){
    _email = email;
    notifyListeners();

    log("Email: $email");
  }
  void setPassword(String password){
    _password = password;
    notifyListeners();

    log("Password: $password");
  }
  void setConfirmPassword(String confirmPassword){
    _confirmPassword = confirmPassword;
    notifyListeners();

    log("Confirm Password: $confirmPassword");
  }
  signup() async{
    try{
      final response = await _auth.signup(_email, _password);

      if(response != null){
        UserModel user = UserModel(uid: response.uid, name: _name, email: _email);

        await _db.saveUser(user.toMap());
      }

    }on FirebaseAuthException catch(e){
      rethrow;
    }catch(e){
      log(e.toString());
      rethrow;
    }
  }
}