part of 'view.dart';

String lorem =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultricies accumsan pharetra. Phasellus metus mi, pretium vel lacus sed, blandit varius elit. Vestibulum semper metus sit amet diam tempus, sed ornare augue aliquam. Praesent tellus odio, luctus vitae efficitur quis, aliquet eu magna. Curabitur nec mi egestas, egestas mauris sed, efficitur augue. Fusce maximus erat in suscipit ultrices. Nulla dolor odio, luctus at sem quis, vehicula porta magna. Fusce neque ex,/Kamar finibus non diam sed, lacinia suscipit metus.";

class HotelDetailPage extends StatelessWidget {
  const HotelDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> uriRecom = [
      {
        "img":
            "https://imgcdn.oto.com/medium/gallery/exterior/38/1240/toyota-kijang-innova-67295.jpg",
        "price": "IDR 200.000",
      },
      {
        "img":
            "https://www.jejakpiknik.com/wp-content/uploads/2018/08/Sewa-kamera-jakarta-barat-utara-kaskus-rental-selatan-timur-pusat-murah-gopro-action-penyewaan-bawah-air-sony-a7s-dslr-630x380.jpg",
        "price": "IDR 53.000",
      },
      {
        "img":
            "https://s.kaskus.id/r540x540/images/2020/07/11/9236790_20200711031704.jpg",
        "price": "IDR 70.000",
      },
      {
        "img":
            "https://imgcdn.oto.com/medium/gallery/exterior/38/1240/toyota-kijang-innova-67295.jpg",
        "price": "IDR 200.000",
      },
      {
        "img":
            "https://www.jejakpiknik.com/wp-content/uploads/2018/08/Sewa-kamera-jakarta-barat-utara-kaskus-rental-selatan-timur-pusat-murah-gopro-action-penyewaan-bawah-air-sony-a7s-dslr-630x380.jpg",
        "price": "IDR 53.000",
      },
      {
        "img":
            "https://s.kaskus.id/r540x540/images/2020/07/11/9236790_20200711031704.jpg",
        "price": "IDR 70.000",
      },
    ];

    List<Map<String, String>> uriRecom2 = [
      {
        "img":
            "https://cdn.almostlanding-bali.com/wp-content/uploads/2017/08/kuta-travel.jpg",
        "price": "FREE",
      },
      {
        "img":
            "https://media-cdn.tripadvisor.com/media/photo-s/0e/76/18/8b/can-t-describe-about.jpg",
        "price": "IDR 50.000",
      },
      {
        "img":
            "https://www.pemburuombak.com/media/k2/items/cache/ed672d1382c9430186e4ccc5b807479b_XL.jpg",
        "price": "IDR 140.000",
      },
      {
        "img":
            "https://cdn.almostlanding-bali.com/wp-content/uploads/2017/08/kuta-travel.jpg",
        "price": "FREE",
      },
      {
        "img":
            "https://media-cdn.tripadvisor.com/media/photo-s/0e/76/18/8b/can-t-describe-about.jpg",
        "price": "IDR 50.000",
      },
      {
        "img":
            "https://www.pemburuombak.com/media/k2/items/cache/ed672d1382c9430186e4ccc5b807479b_XL.jpg",
        "price": "IDR 140.000",
      },
    ];

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
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
                      margin: EdgeInsets.only(
                        left: 24,
                      ),
                      height: 130,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: uriRecom
                            .map(
                              (e) => Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 12),
                                    width: 90,
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
                                    margin: EdgeInsets.only(left: 6),
                                    child: Text(
                                      e["price"],
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Container(
                      height: 24,
                      margin: EdgeInsets.fromLTRB(24, 0, 24, 6),
                      child: Text(
                        "Recommendation destination",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 24,
                      ),
                      height: 130,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: uriRecom2
                            .map(
                              (e) => Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 12),
                                    width: 90,
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
                                    margin: EdgeInsets.only(left: 6),
                                    child: Text(
                                      e["price"],
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                  ),
                                ],
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
