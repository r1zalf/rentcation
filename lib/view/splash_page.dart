part of 'view.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({Key key}) : super(key: key);

  @override
  _SplashpageState createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  void initState() {
    super.initState();

    context.read<AuthViewModel>().currentUser();
    String uid = context.read<AuthViewModel>().uid;
    if (uid != "") {
      context.read<UserViewModel>().getUer(uid);
      context.read<OrderViewModel>().getOrder(uid);
    }
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, route.mainRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/logo.png"),
            )),
          ),
          Center(
            child: Text(
              "Rentcation",
              style: Theme.of(context).textTheme.headline2,
            ),
          )
        ],
      ),
    );
  }
}
