part of 'view.dart';

class HotelDetailPage extends StatelessWidget {
  const HotelDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          bottomSheet: Consumer<HotelViewModel>(builder: (context, value, _) {
            return Container(
              padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
              height: 70,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Harga termurah",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _helper.formatIDR(
                                (double.parse(value.hotelx.minRate) * 17000)),
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(
                                    color: Theme.of(context).accentColor,
                                    fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "/Room",
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      color: Colors.black87,
                                    ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Consumer<AuthViewModel>(
                    builder: (context, value, _) => Container(
                      height: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (value.loginResult.isHasData ||
                              value.registResult.isHasData) {
                            Navigator.pushNamed(context, route.roomResultRoute);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  action: SnackBarAction(
                                    label: "login",
                                    textColor: Colors.white,
                                    onPressed: () {
                                      Navigator.pushNamedAndRemoveUntil(context,
                                          route.homeRoute, (route) => false,
                                          arguments: 2);
                                    },
                                  ),
                                  padding: EdgeInsets.all(9),
                                  content: Text(
                                    'Login dulu yuk..',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  duration: const Duration(seconds: 3),
                                  backgroundColor:
                                      Theme.of(context).accentColor),
                            );
                          }
                        },
                        child: Text("Select room"),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
          body: Consumer<HotelViewModel>(
            builder: (context, value, _) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          scale: 1,
                          image: NetworkImage(
                              "https://photos.hotelbeds.com/giata/original/" +
                                  value.hotely.images.first.path),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                      child: Text(
                        value.hotely.name.content,
                        style: Theme.of(context).textTheme.headline3.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(24, 0, 24, 0),
                      child: Text(
                        value.hotely.address.content,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(24, 0, 24, 21),
                      child: RaitingStras(
                        voteAverage: value.hotely.ranking.toDouble(),
                      ),
                    ),
                    Container(
                      height: 24,
                      margin: EdgeInsets.fromLTRB(24, 0, 24, 6),
                      child: Text(
                        "Descriptiom",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(24, 0, 24, 21),
                      child: Text(
                        value.hotely.description.content,
                        maxLines: 10,
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              color: Colors.black,
                            ),
                      ),
                    ),
                    Container(
                      height: 24,
                      margin: EdgeInsets.fromLTRB(24, 0, 24, 6),
                      child: Text(
                        "Recommendation product rent",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      height: 180,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: uriRecom
                            .map(
                              (e) => Container(
                                margin: EdgeInsets.only(
                                    left: uriRecom.indexOf(e) == 0 ? 24 : 0,
                                    right: 12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                            .copyWith(
                                                fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 6),
                                      child: Text(
                                        e["price"],
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 6, bottom: 6),
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
                    Container(
                      height: 24,
                      margin: EdgeInsets.fromLTRB(24, 21, 24, 6),
                      child: Text(
                        "Recommendation destination",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      height: 180,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: uriRecom2
                            .map(
                              (e) => Container(
                                margin: EdgeInsets.only(
                                    left: uriRecom2.indexOf(e) == 0 ? 24 : 0,
                                    right: 12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                            .copyWith(
                                                fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 6),
                                      child: Text(
                                        e["price"],
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 6, bottom: 6),
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
                    Container(
                      height: 24,
                      margin: EdgeInsets.fromLTRB(24, 21, 24, 6),
                      child: Text(
                        "Recommendation foods",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w600),
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
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 6),
                                      child: Text(
                                        e["price"],
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
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
                      height: 80,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
