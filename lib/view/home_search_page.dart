part of 'view.dart';

class HomeSearchPage extends StatefulWidget {
  const HomeSearchPage({Key key}) : super(key: key);

  @override
  _HomeSearchPageState createState() => _HomeSearchPageState();
}

class _HomeSearchPageState extends State<HomeSearchPage> {
  var std = DateFormat('yyyy-MM-dd');
  DateTime t1;

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Consumer<HotelViewModel>(builder: (context, value, _) {
          return Container(
            padding: EdgeInsets.all(24),
            child: Wrap(
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 32),
                  leading: GestureDetector(
                    onTap: () {
                      bc.read<HotelViewModel>().setAdults(false);
                    },
                    child: Icon(Icons.remove,
                        color: Theme.of(context).accentColor),
                  ),
                  title: Center(
                    child: Text(
                      value.adults.toString() + ' Adults',
                      style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      bc.read<HotelViewModel>().setAdults(true);
                    },
                    child: Icon(
                      Icons.add,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Done"),
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          // BG TITLE HEAD
          Container(
            width: double.infinity,
            height: 320,
            color: Theme.of(context).primaryColor,
          ),

          // CONTENT
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // MAIN CONTENT
              SafeArea(
                child: Container(
                  margin: EdgeInsets.only(top: 51, right: 24, left: 24),
                  padding: EdgeInsets.all(24),
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Consumer<HotelViewModel>(
                    builder: (context, value, _) => Column(
                      children: [
                        TextField(
                          onTap: () {
                            Navigator.pushNamed(context, route.cityListRoute);
                          },
                          readOnly: true,
                          decoration: InputDecoration(
                            hintStyle: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(color: Colors.black),
                            hintText: value.city == null
                                ? "Select city"
                                : value.city.name.content,
                            suffixIcon:
                                Icon(Icons.search, color: Color(0xFF3C8EC7)),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextField(
                          readOnly: true,
                          onTap: () async {
                            DateTime date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(), // Refer step 1
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2025),
                            );

                            setState(() => t1 = date);

                            context
                                .read<HotelViewModel>()
                                .setCheckIn(std.format(date));
                          },
                          decoration: InputDecoration(
                            hintStyle: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(color: Colors.black),
                            hintText: value.checkIn == ""
                                ? "check-in date"
                                : value.checkIn,
                            suffixIcon: Icon(
                              Icons.date_range,
                              color: Color(0xFF3C8EC7),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextField(
                          readOnly: true,
                          onTap: () async {
                            if (t1 != null) {
                              DateTime date = await showDatePicker(
                                context: context,
                                initialDate: t1, // Refer step 1
                                firstDate: t1,
                                lastDate: DateTime(2025),
                              );
                              context
                                  .read<HotelViewModel>()
                                  .setCheckOut(std.format(date));
                            }
                          },
                          decoration: InputDecoration(
                            hintStyle: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(color: Colors.black),
                            hintText: value.checkOut == ""
                                ? "check-out date"
                                : value.checkOut,
                            suffixIcon: Icon(
                              Icons.date_range,
                              color: Color(0xFF3C8EC7),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextField(
                          readOnly: true,
                          onTap: () {
                            _settingModalBottomSheet(context);
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintStyle: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(color: Colors.black),
                            hintText: value.peoples,
                            suffixIcon: Icon(
                              Icons.people,
                              color: Color(0xFF3C8EC7),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (value.city == null ||
                                  value.checkOut == "" ||
                                  value.checkIn == "") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    padding: EdgeInsets.all(8),
                                    content: Text(
                                      'Pastikan semua field ter-isi yak!',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith(color: Colors.white),
                                    ),
                                    duration: const Duration(seconds: 3),
                                    backgroundColor:
                                        Theme.of(context).accentColor,
                                  ),
                                );
                              } else {
                                await context
                                    .read<HotelViewModel>()
                                    .searchHotel();

                                if (value.hotelSearch.isHasData) {
                                  Navigator.pushNamed(
                                      context, route.hotelResultRoute);
                                }

                                if (value.hotelSearch.isError) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      padding: EdgeInsets.all(8),
                                      content: Text(
                                        'Ada yang salah, coba ganti tanggal yuk!',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            .copyWith(color: Colors.white),
                                      ),
                                      duration: const Duration(seconds: 3),
                                      backgroundColor:
                                          Theme.of(context).accentColor,
                                    ),
                                  );
                                }
                              }
                            },
                            child: value.hotelSearch.isLoading
                                ? CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                  )
                                : Text(
                                    "Search Hotel",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 24, top: 24, bottom: 12),
                child: Text(
                  "Promo",
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),

              CarouselSlider(
                options: CarouselOptions(height: 180),
                items: [
                  "https://img.freepik.com/free-vector/sale-promotion-banner-template_74379-177.jpg",
                  "https://img.freepik.com/free-vector/modern-sale-banner-colorful-comic-style_1361-1314.jpg",
                  "https://static.vecteezy.com/system/resources/thumbnails/002/038/176/small/weekend-sale-banner-template-promotion-vector.jpg",
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(i),
                            scale: 1,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Container(
                margin: EdgeInsets.only(left: 24, top: 24, bottom: 12),
                child: Text(
                  "Recomendation Destinations",
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Container(
                height: 180,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: uriRecom3
                      .map(
                        (e) => Container(
                          margin: EdgeInsets.only(
                              left: uriRecom3.indexOf(e) == 0 ? 24 : 0,
                              right: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 140,
                                height: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    scale: 1,
                                    image: NetworkImage(e["img"]),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 6, top: 6),
                                child: Text(
                                  e["name"],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 6),
                                child: Text(
                                  e["price"],
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ),
                              SizedBox(height:  12,),
                              Container(
                                margin: EdgeInsets.only(left: 6, bottom: 6),
                                child: RaitingStras(
                                  voteAverage: 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
