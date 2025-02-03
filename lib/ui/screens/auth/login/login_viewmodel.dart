import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto_final/core/other/base_viewmodel.dart';
import 'package:projeto_final/core/services/auth_service.dart';

class LoginViewmodel extends BaseViewModel{
  LoginViewmodel(
      this._auth
  );

  final AuthService _auth;
  String _email='', _password='';

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
  login() async{
    try{
      await _auth.login(_email, _password);
    }on FirebaseAuthException catch(e){
      rethrow;
    }catch(e){
      log(e.toString());
      rethrow;
    }
  }
}