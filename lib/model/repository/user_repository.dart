
import 'dart:convert';

import 'package:rentcation/model/entity/login_response.dart';
import 'package:rentcation/model/service/local_service.dart';
import 'package:rentcation/model/service/network_service.dart';

class UserRepository {
  NetworkService _networkService = NetworkService();
  LocalService _localService = LocalService();

  Future<LoginResponse> login(String email, String password) async {
    final dynamic result = await _networkService.post(
      _networkService.login,
      body: {"email": email, "password": password},
    );
    LoginResponse login = LoginResponse.fromJson(result);
    if (login.meta.code != 200) throw Exception();

    await _localService.cache(_networkService.login, json.encode(result));

    return login;
  }

  Future<LoginResponse> getCacheLogin() async {
    String result = await _localService.getCache(_networkService.login);

    if (result != null) {
      final resultDcode = json.decode(result);
      return LoginResponse.fromJson(resultDcode);
    }
  }

  // Future<LoginResponse> registration(User user) async {
  //   final dynamic result = await _networkService.post(
  //     _networkService.register,
  //     body: jsonEncode(user.toJsonRegister()),
  //     headers: {
  //       "Content-Type": "application/json",
  //       "Accept": "application/json"
  //     },
  //   );

  //   LoginResponse login = LoginResponse.fromJson(result);
  //   if (login.meta.code != 200) throw Exception();

  //   await _localService.cache(_networkService.login, json.encode(result));

  //   return login;
  // }

  // Future<Logout> logout() async {
  //   LoginResponse? login = await getCacheLogin();

  //   await _localService.deleteCache(_networkService.login);

  //   final result = await _networkService.post(
  //     _networkService.logout,
  //     headers: {
  //       "Content-Type": "application/json",
  //       "Accept": "application/json",
  //       "Authorization": _networkService.token(login!)
  //     },
  //   );

  //   return Logout.fromJson(result);
  // }
}
