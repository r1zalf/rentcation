import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentcation/utils/router.dart';
import 'package:rentcation/utils/theme.dart';
import 'package:rentcation/utils/router_path.dart' as route;
import 'package:rentcation/view/view.dart';
import 'package:rentcation/view_model/hotel_view_model.dart';
import 'package:rentcation/view_model/order_view_model.dart';
import 'package:rentcation/view_model/user_view_model.dart';

import 'view_model/auth_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => HotelViewModel(),
        ),
         ChangeNotifierProvider(
          create: (_) => UserViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Rentcation',
        theme: themeData,
        debugShowCheckedModeBanner: false,
        initialRoute: route.splashRoute,
        onGenerateRoute: (RouteSettings settings) => getRoute(settings),
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<HotelViewModel>().getCacheCities();

    return Consumer<AuthViewModel>(
      builder: (context, value, _) => HomePage(),
    );
  }
}
