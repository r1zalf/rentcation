import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:rentcation/model/error/app_exception.dart';

import 'base_service.dart';

class NetworkService extends BaseService {

  @override
  Future get(String url, {dynamic headers}) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url), headers: headers);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future post(String url, {dynamic body, dynamic headers}) async {
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url),
          body: body, headers: headers);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future put(String url, {dynamic body, dynamic headers}) async {
    dynamic responseJson;
    try {
      final response = await http.put(Uri.parse(baseUrl + url),
          body: body, headers: headers);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 422:
        throw BadRequestException("");
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw BadRequestException("Authentication Failed");
      default:
        throw FetchDataException();
    }
  }
}
