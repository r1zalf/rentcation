part of 'view.dart';

class HomePage extends StatefulWidget {
  final int index;
  const HomePage({this.index, Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var indexPage = 0;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    indexPage = widget.index ?? indexPage;
    pageController = PageController(initialPage: indexPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexPage,
        onTap: (value) {
          setState(() {
            indexPage = value;
            pageController.jumpToPage(value);
          });
        },
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_rounded),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            indexPage = value;
          });
        },
        scrollDirection: Axis.horizontal,
        children: [
          HomeSearchPage(),
          HomeHistoryPage(),
          Consumer<AuthViewModel>(
            builder: (context, value, _) {
              if (value.loginResult.isHasData || value.registResult.isHasData) {
                return HomeProfilepage();
              } else {
                return SignInPage();
              }
            },
          ),
        ],
      ),
    );
  }
}
