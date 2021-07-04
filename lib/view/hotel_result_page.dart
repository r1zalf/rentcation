part of 'view.dart';

class HotelResultPage extends StatelessWidget {
  const HotelResultPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Consumer<HotelViewModel>(builder: (context, value, _) {
            return Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(24),
                        width: double.infinity,
                        height: 120,
                        color: Theme.of(context).primaryColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Hotel in " + value.city.name.content,
                                    maxLines: 1,
                                    textAlign: TextAlign.end,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    value.checkIn + " ~ " + value.checkOut,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                  Text(
                                    "for " + value.peoples,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 21),
                        width: double.infinity,
                        height: 40,
                        color: Theme.of(context).accentColor,
                        child: Row(
                          children: [
                            Icon(Icons.filter_list,color: Colors.white,),
                            SizedBox(width: 12),
                            Text(
                              "Sorted by low price",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 160, left: 12, right: 12),
                  child: ListView.builder(
                    itemCount: value.hotelSearchResponse.hotels.hotels.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, int index) {
                      return Container(
                        margin: EdgeInsets.only(top: index == 0 ? 12 : 0),
                        child: itemHotel(context,
                            value.hotelSearchResponse.hotels.hotels[index]),
                      );
                    },
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget itemHotel(BuildContext context, Hotelx hotelx) =>
      Consumer<HotelViewModel>(
        builder: (context, value, _) {
          Hotel hotely = value.hotelResponse.hotels
              .where((e) => e.code == hotelx.code)
              .toList()
              .first;

          return GestureDetector(
            onTap: () {
              context.read<HotelViewModel>().setHotelx(hotelx);
              context.read<HotelViewModel>().setHotely(hotely);

              Navigator.pushNamed(
                context,
                route.hotelDetailtRoute,
              );
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 12),
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(color: Colors.black.withOpacity(0.1), width: 1),
              ),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        scale: 1,
                        image: NetworkImage(
                            "https://photos.hotelbeds.com/giata/original/" +
                                hotely.images.first.path),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    width: MediaQuery.of(context).size.width - ((12 * 4) + 100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hotelx.name,
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .copyWith(color: Colors.black),
                            ),
                            Text(
                              hotely.address.content,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Harga termurah",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                            Row(
                              children: [
                                Text(
                                  Helper().formatIDR(
                                      (double.parse(hotelx.minRate) * 17000)),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                          color: Theme.of(context).accentColor,
                                          fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "/Kamar",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(
                                        color: Colors.black87,
                                      ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
}
