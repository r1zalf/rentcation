import 'dart:convert';

import 'package:crypto/crypto.dart';

abstract class BaseService {
  final baseUrl = "https://rentcation.herokuapp.com";
  final baseUrlHotel = "https://api.test.hotelbeds.com";

  final login = "/user/login/";
  final logout = "/logout";
  final register = "/register";
  final food = "/food";
  final checkout = "/checkout";
  final transaction = "/transaction";

  
  final header = {
    "Api-key": "abec97c6718b22018498677a23214348",
    "X-Signature": sha256
        .convert(
          utf8.encode(
            "abec97c6718b22018498677a23214348" +
                "772e5e1902" +
                (DateTime.now().millisecondsSinceEpoch.toInt() / 1000)
                    .round()
                    .toString(),
          ),
        )
        .toString(),
    "Accept": "application/json",
    "Accept-Encoding": "gzip"
  };

  Map<String, String> getHeader2(String time) =>{
    "Api-key": "abec97c6718b22018498677a23214348",
    "X-Signature": sha256
        .convert(
          utf8.encode(
            "abec97c6718b22018498677a23214348" +
                "772e5e1902" +
                time
          ),
        )
        .toString(),
    "Accept": "application/json",
    "Accept-Encoding": "gzip",
    "Content-Type": "application/json"
  };

  // for post
  final header2 = {
    "Api-key": "abec97c6718b22018498677a23214348",
    "X-Signature": sha256
        .convert(
          utf8.encode(
            "abec97c6718b22018498677a23214348" +
                "772e5e1902" +
                (DateTime.now().millisecondsSinceEpoch.toInt() / 1000)
                    .round()
                    .toString(),
          ),
        )
        .toString(),
    "Accept": "application/json",
    "Accept-Encoding": "gzip",
    "Content-Type": "application/json"
  };
  // Hotel
  final cities =
      "/hotel-content-api/1.0/locations/destinations?fields=all&countryCodes=ID";

  Future<dynamic> get(String url);
  Future<dynamic> post(String url);
  Future<dynamic> put(String url);
}
