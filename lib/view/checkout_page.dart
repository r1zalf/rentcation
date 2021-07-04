part of 'view.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<HotelViewModel, UserViewModel>(
        builder: (context, value, value2, _) => Stack(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              color: Theme.of(context).primaryColor,
            ),
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(24),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Expanded(
                      child: Text(
                        "Checkout",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              padding: EdgeInsets.only(top: 100, left: 24, right: 24),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
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
                          margin: EdgeInsets.only(top: 12, left: 12),
                          child: Text(
                            value.hotelx.name,
                            style:
                                Theme.of(context).textTheme.headline4.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 6, left: 12),
                          child: Text(
                            "check-in " + value.checkIn,
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 0, left: 12),
                          child: Text(
                            "check-out " + value.checkOut,
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 12, left: 12),
                          child: Text(
                            "1 x " + value.hotelx.rooms[value.room].name,
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 6, bottom: 12, left: 12),
                          child: Text(
                            value.peoples,
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 12, left: 12),
                          child: Text(
                            "Harga",
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 6, bottom: 12, left: 12),
                          child: Text(
                            _helper.formatIDR(
                              (double.parse(value.hotelx.rooms[value.room].rates
                                      .first.net) *
                                  17000),
                            ),
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24),
                    padding: EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 12,
                          ),
                          child: Text(
                            "Detail pemesan",
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 6,
                          ),
                          child: Text(
                            value2.userModel.name,
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 6,
                          ),
                          child: Text(
                            value2.userModel.email,
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24),
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        await context.read<OrderViewModel>().createOrder(
                              value2.userModel.id,
                              value.hotelx.name,
                              value.checkIn,
                              value.checkOut,
                              value.hotelx.rooms[value.room].name,
                              value.peoples,
                              "https://photos.hotelbeds.com/giata/original/" +
                                  value.hotely.images.first.path,
                              value.hotelx.rooms[value.room].rates.first.net,
                            );

                        Navigator.pushNamedAndRemoveUntil(
                            context, route.mainRoute, (route) => false);
                      },
                      child: Text("Checkout now"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
