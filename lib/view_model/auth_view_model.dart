import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rentcation/utils/result_state.dart';

class AuthViewModel extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;

  // Field
  String _errorMsg;

  // Field getter
  String get errorMsg => _errorMsg;
  String get uid => _auth.currentUser == null ? "" :_auth.currentUser.uid;

  //state
  ResultState _loginResult;
  ResultState _registResult;


// state getter
  ResultState get loginResult => _loginResult;
  ResultState get registResult => _registResult;


  login(String email, String password) async {
    try {
      _loginResult = ResultState.Loading;
      notifyListeners();
      UserCredential _user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (_user != null) {
        _loginResult = ResultState.HasData;
        notifyListeners();
      } else {
        _loginResult = ResultState.NoData;
        notifyListeners();
      }
    } catch (e) {
      _errorMsg = e.toString();
      _loginResult = ResultState.Error;
      notifyListeners();
    }
  }

  regist(String email, String password) async {
    try {
      _registResult = ResultState.Loading;
      notifyListeners();
      UserCredential _user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (_user != null) {
        _registResult = ResultState.HasData;
        notifyListeners();
      } else {
        _registResult = ResultState.NoData;
        notifyListeners();
      }
    } catch (e) {
      _errorMsg = e.toString();
      _registResult = ResultState.Error;
      notifyListeners();
    }
  }

  currentUser() {
    if (_auth.currentUser != null) {
      _loginResult = ResultState.HasData;
    } else {
      _loginResult = ResultState.NoData;
    }
  }

  logout() async {
    await _auth.signOut();
    _loginResult = ResultState.NoData;
    notifyListeners();
  }
}
