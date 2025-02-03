import 'dart:convert';

class UserModel {
  final String? uid, name, email, imageUrl;

  UserModel({
    this.uid,
    this.name,
    this.email,
    this.imageUrl,
  });

  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'email': email,
      'imageUrl': imageUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map){
    return UserModel(
      uid: map['uid'] != null ? map['uid'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel{uid: $uid, name: $name, email: $email, imageUrl: $imageUrl}';
  }
}