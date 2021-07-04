import 'package:flutter/material.dart';
import 'package:rentcation/main.dart';
import 'package:rentcation/utils/router_path.dart' as route;
import 'package:rentcation/view/view.dart';

Route<RouteSettings> getRoute(RouteSettings settings) {

  return MaterialPageRoute(
    builder: (context) {
      switch (settings.name) {
        case route.mainRoute:
          return App();
        case route.splashRoute:
          return Splashpage();
        case route.homeRoute:
        var index = settings.arguments as int;
          return HomePage(index: index);
        case route.signInRoute:
          return SignInPage();
        case route.signUpRoute:
          return SignUpPage();
        case route.hotelResultRoute:
          return HotelResultPage();
        case route.hotelDetailtRoute:
          return HotelDetailPage();
        case route.cityListRoute:
          return CityListPage();
        case route.roomResultRoute:
          return RoomResultPage();
        case route.checkoutRote:
          return CheckoutPage();
        case route.orderDetailRoute:
          return OrderDetailPage();
        default:
          return Container();
      }
    },
  );
}
