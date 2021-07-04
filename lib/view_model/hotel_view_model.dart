import 'package:flutter/material.dart';
import 'package:rentcation/model/entity/city_response.dart';
import 'package:rentcation/model/entity/hotel_response.dart';
import 'package:rentcation/model/entity/hotel_search_response.dart';
import 'package:rentcation/model/repository/hotel_repository.dart';
import 'package:rentcation/utils/result_state.dart';

class HotelViewModel extends ChangeNotifier {
  HotelRepository _hotelRepository = HotelRepository();

  //field
  List<Destination> _cities;
  List<Destination> _citiesDefault;
  Destination _city;
  HotelResponse _hotelResponse;
  List<int> _hotelCodes;
  HotelSearchResponse _hotelSearchResponse;
  Hotelx _hotelx;
  Hotel _hotely;
  String timeInSecond = (DateTime.now().millisecondsSinceEpoch.toInt() / 1000)
                    .round()
                    .toString();

  String _checkIn = "";
  String _checkOut = "";

  int _adults = 0;
  int _children = 0;


  int _room;
  // field getter
  int get room => _room;
  List<Destination> get cities => _cities;
  Destination get city => _city;
  String get checkIn => _checkIn;
  String get checkOut => _checkOut;
  HotelSearchResponse get hotelSearchResponse => _hotelSearchResponse;
  HotelResponse get hotelResponse => _hotelResponse;
  Hotelx get hotelx => _hotelx;
  Hotel get hotely => _hotely;
  int get adults => _adults;
  int get children => _children;

  String get peoples => _adults == 0 && _children == 0
      ? "People"
      : "$_adults Adults";


  setRoom(int value) {
    _room = value;
  }

  setAdults(bool isPlus) {
    if (isPlus) {
      _adults += 1;
      notifyListeners();
    } else {
      if (_adults > 0) {
        _adults -= 1;
        notifyListeners();
      }
    }
  }

  setChildren(bool isPlus) {
    if (isPlus) {
      _children += 1;
      notifyListeners();
    } else {
      if (_children > 0) {
        _children -= 1;
        notifyListeners();
      }
    }
  }

  setHotelx(Hotelx value) {
    _hotelx = value;
    notifyListeners();
  }

  setHotely(Hotel value) {
    _hotely = value;
    notifyListeners();
  }

  // field setter
  setCheckIn(String value) {
    _checkIn = value;
    notifyListeners();
  }

  setCheckOut(String value) {
    _checkOut = value;
    notifyListeners();
  }

  // State
  ResultState _cityResult = ResultState.Init;
  ResultState _hotelSearch;

  // State getter
  ResultState get cityResult => _cityResult;
  ResultState get hotelSearch => _hotelSearch;

  selectCity(Destination value) {
    _city = value;
    getHotelCode();
    notifyListeners();
  }

  getHotelCode() async {
    var hotel = await _hotelRepository.getHotel(_city.code);
    _hotelCodes = hotel.hotels.map((e) => e.code).toList();

    // _hotelCodes
    _hotelResponse = hotel;
    notifyListeners();
  }

  // search per word
  searchCity(String value) {
    if (value.length != 0) {
      _cities =
          _citiesDefault.where((e) => e.name.content.toLowerCase().contains(value)).toList();
      notifyListeners();
    } else {
      _cities = _citiesDefault;
      notifyListeners();
    }
  }

  // Load from cache
  getCacheCities() async {
    try {
      var city = await _hotelRepository.getCacheCity();
      // Sort form ASCD world
      city.destinations.sort(
        (Destination a, Destination b) => a.name.content[0].compareTo(
          b.name.content[0],
        ),
      );
      _cities = city.destinations;
      _citiesDefault = city.destinations;

      _cityResult = ResultState.HasData;
      notifyListeners();
    } catch (e) {
      getCity();
    }
  }

  // init load from api
  getCity() async {
    try {
      _cityResult = ResultState.Loading;
      var city = await _hotelRepository.getCity();

      if (city != null) {
        // Sort form ASCD world
        city.destinations.sort(
          (Destination a, Destination b) => a.name.content[0].compareTo(
            b.name.content[0],
          ),
        );

        _cities = city.destinations;
        _citiesDefault = city.destinations;

        _cityResult = ResultState.HasData;
        notifyListeners();
      }
    } catch (e) {
      _cityResult = ResultState.Error;
      notifyListeners();
    }
  }

  searchHotel() async {
    try {
      _hotelSearch = ResultState.Loading;
      notifyListeners();

      var hotels = await _hotelRepository.searchHotel(
        _hotelCodes,
        _checkIn,
        _checkOut,
        [_adults, children],
        timeInSecond
      );
      if (hotels != null) {
        hotels.hotels.hotels.sort((Hotelx a, Hotelx b) => a.minRate.compareTo(b.minRate));
        _hotelSearchResponse = hotels;
        _hotelSearch = ResultState.HasData;
        notifyListeners();
      }
    } catch (e) {
      _hotelSearch = ResultState.Error;
      notifyListeners();
    }
  }
}
