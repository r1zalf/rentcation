import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:rentcation/model/entity/order_response.dart';

class OrderViewModel extends ChangeNotifier {
  final CollectionReference _order =
      FirebaseFirestore.instance.collection('order');

  List<OrderResponse> _listOrder = [];

  List<OrderResponse> get listOrder => _listOrder;

  OrderResponse _detail;
  OrderResponse get detail => _detail;

  setIndexDetail(OrderResponse value) {
    _detail = value;

  }



  createOrder(String userId, String nameHotel, String checkIn, String checkOut,
      String nameRoom, String peoples, String imgUrl, String price) {
    var dummyBookingCode = randomAlphaNumeric(12).toUpperCase();

    _order
        .doc(dummyBookingCode)
        .set({
          "bookingCode": dummyBookingCode,
          "userId": userId,
          "nameHotel": nameHotel,
          "checkIn": checkIn,
          "checkOut": checkOut,
          "nameRoom": nameHotel,
          "people": peoples,
          "imgUrl": imgUrl,
          "price" : price,
        })
        .then((e) {
          debugPrint("APP-LOGS" + " SUCCESS ORDER");
          getOrder(userId);
        })
        .onError((error, stackTrace) {
          debugPrint("APP-LOGS" + " EEROR");
        });
  }

  getOrder(String userId) async {
    var doc = await _order.get();
    var lis = doc.docs
        .map(
          (e) => OrderResponse(
            bookingCode: e.get("bookingCode"),
            userId: e.get("userId"),
            nameHotel: e.get("nameHotel"),
            nameRoom: e.get("nameRoom"),
            checkIn: e.get("checkIn"),
            checkOut: e.get("checkOut"),
            peoples: e.get("people"),
            imgUrl: e.get("imgUrl"),
            price: e.get("price")
          ),
        )
        .toList();

    _listOrder = lis.where((e) => e.userId == userId).toList();
  }
}
