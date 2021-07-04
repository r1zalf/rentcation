import 'dart:convert';

import 'package:rentcation/model/entity/city_response.dart';
import 'package:rentcation/model/entity/hotel_response.dart';
import 'package:rentcation/model/entity/hotel_search_response.dart';
import 'package:rentcation/model/service/local_service.dart';
import 'package:rentcation/model/service/network_service.dart';

class HotelRepository {
  NetworkService _networkService = NetworkService();
  LocalService _localService = LocalService();

  Future<CityResponse> getCity() async {
    final result = await _networkService.get(
      _networkService.baseUrlHotel + _networkService.cities,
      headers: _networkService.header,
    );

    // cache to local
    await _localService.cache("citiesResponse", json.encode(result));

    return CityResponse.fromJson(result);
  }

  Future<CityResponse> getCacheCity() async {
    String result = await _localService.getCache("citiesResponse");
    if (result == null) Exception();
    final resultDcode = json.decode(result);
    return CityResponse.fromJson(resultDcode);
  }

  Future<HotelResponse> getHotel(String cityCode) async {
    final result = await _networkService.get(
      _networkService.baseUrlHotel +
          "/hotel-content-api/1.0/hotels?fields=all&destinationCode=$cityCode&countryCode=ID",
      headers: _networkService.header,
    );
    return HotelResponse.fromJson(result);
  }

  Future<HotelSearchResponse> searchHotel(List<int> hotelCodes, String checkIn,
      String checkOut, List<int> peoples, String time) async {
    var _body = {
      "stay": {"checkIn": checkIn, "checkOut": checkOut},
      "occupancies": [
        {"rooms": 1, "adults": peoples[0], "children": 0}
      ],
      "hotels": {"hotel": List<dynamic>.from(hotelCodes.map((x) => x))}
    };
    print(json.encode(_body).toString());
    final result = await _networkService.post(
      _networkService.baseUrlHotel + "/hotel-api/1.0/hotels",
      body: json.encode(_body),
      headers: _networkService.getHeader2(time),
    );
    return HotelSearchResponse.fromJson(result);
  }
}
