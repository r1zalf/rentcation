part of 'view.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<OrderViewModel, UserViewModel>(
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
                        "Your booking",
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
                              image: NetworkImage(value.detail.imgUrl),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 12, left: 12),
                          child: Text(
                            value.detail.nameHotel,
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
                            "check-in " + value.detail.checkIn,
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 0, left: 12),
                          child: Text(
                            "check-out " + value.detail.checkOut,
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 12, left: 12),
                          child: Text(
                            "1 x " + value.detail.nameRoom,
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
                            value.detail.peoples,
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
                              (double.parse(value.detail.price) *
                                  17000),),
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
                  padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        QrImage(
                              version: 6,
                              foregroundColor: Colors.black,
                              errorCorrectionLevel: QrErrorCorrectLevel.M,
                              padding: EdgeInsets.all(0),
                              size: 100,
                              data: value.detail.bookingCode),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Tunjukan QR ini pada resepsonis", style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.black,),),
                              ],
                            ),
                          ),
                        ),
                        
                      ],
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
