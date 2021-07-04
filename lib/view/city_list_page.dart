part of 'view.dart';

class CityListPage extends StatefulWidget {
  const CityListPage({Key key}) : super(key: key);

  @override
  _CityListPageState createState() => _CityListPageState();
}

class _CityListPageState extends State<CityListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Consumer<HotelViewModel>(builder: (context, value, _) {
          return Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(24),
                  width: double.infinity,
                  // height: 120,
                  color: Theme.of(context).primaryColor,
                  child: TextField(
                    onChanged: (value) {
                      context.read<HotelViewModel>().searchCity(value);

                    },
                    decoration: InputDecoration(
                      hintText: "Cari kota di sini",
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.cities.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        context.read<HotelViewModel>().selectCity(value.cities[index]);
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          top: index == 0 ? 12 : 0,
                          bottom: 12,
                          left: 12,
                          right: 12,
                        ),
                        // padding: EdgeInsets.all(12),
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              value.cities[index].name.content,
                              style:
                                  Theme.of(context).textTheme.headline4.copyWith(
                                        color: Colors.black,
                                      ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
