import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rentcation/model/entity/user.dart';

class UserViewModel extends ChangeNotifier {
  final CollectionReference _usersCollecion =
      FirebaseFirestore.instance.collection('users');
  UserModel _userModel;

  UserModel get userModel => _userModel;
  setUser(String id, String name, String email, String password) {
    _userModel = UserModel(
      id: id,
      name: name,
      email: email,
      password: password,
    );
    _usersCollecion
        .doc(id)
        .set(_userModel.toJson())
        .then((value) => debugPrint("APP-LOG" + " SUCCESS"))
        .onError((error, stackTrace) => debugPrint("APP-LOG" + " ERROR"));
  }

  getUer(String id) async {
    var doc = await _usersCollecion.doc(id).get();
    _userModel = UserModel(
      id: id,
      name: doc.get("name"),
      email: doc.get("email"),
    );
  }
}
