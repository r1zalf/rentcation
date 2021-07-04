part of 'view.dart';

class RoomResultPage extends StatelessWidget {
  const RoomResultPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Consumer<HotelViewModel>(
            builder: (context, value, _) => Column(
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
                              "Availabel in " + value.hotelx.name,
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
                Expanded(
                  child: ListView.builder(
                    itemCount: value.hotelx.rooms.length,
                    itemBuilder: (BuildContext context, int index) {
                      
                      return Container(
                        margin: EdgeInsets.only(
                          top: index == 0 ? 12 : 0,
                          bottom: 12,
                          left: 12,
                          right: 12,
                        ),
                        width: double.infinity,
                        // height: 80,x/x/
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  scale: 1,
                                  image: NetworkImage(
                                      "https://photos.hotelbeds.com/giata/original/" +
                                          value.hotely.images.first.path),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 140,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          value.hotelx.rooms[index].name,
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                        ),
                                        Text(
                                          _helper.formatIDR(
                                            (double.parse(value
                                                    .hotelx
                                                    .rooms[index]
                                                    .rates
                                                    .first
                                                    .net) *
                                                17000),
                                          ),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context.read<HotelViewModel>().setRoom(index);
                                      Navigator.pushNamed(context, route.checkoutRote);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(left: 12),
                                      width: 120,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).accentColor,
                                        borderRadius:
                                            BorderRadius.circular(12),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Select",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
