import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto_final/core/models/user_model.dart';
import 'package:projeto_final/core/other/base_viewmodel.dart';
import 'package:projeto_final/core/services/db_service.dart';

class HomeViewmodel extends BaseViewModel{
  final DataBaseService _db;
  UserModel? _user;

  HomeViewmodel(
      this._db,
      String uid
  ){
    fetchUserData(uid);
  }

  fetchUserData(String uid) async{
    final response = await _db.loadUser(uid);

    if(response != null){
      _user = UserModel.fromMap(response);

    }
  }

  UserModel? get user => _user;
}