part of 'view.dart';

class HomeHistoryPage extends StatelessWidget {
  const HomeHistoryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderViewModel>(
      builder: (context, value, _) {
        return value.listOrder.length == 0
            ? Container()
            : ListView.builder(
                itemCount: value.listOrder.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: index == 0 ? 12 : 0,
                        bottom: 6),
                    child: item(
                      context,
                      value.listOrder[index],
                    ),
                  );
                },
              );
      },
    );
  }

  Widget item(BuildContext context, OrderResponse _order) => GestureDetector(
        onTap: () {
          context.read<OrderViewModel>().setIndexDetail(_order);
          Navigator.pushNamed(
            context,
            route.orderDetailRoute,
          );
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 12),
          width: double.infinity,
          height: 140,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black.withOpacity(0.1), width: 1),
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
                      _order.imgUrl,
                    ),
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
                          _order.nameHotel,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              .copyWith(color: Colors.black),
                        ),
                        Text(
                          _order.nameRoom,
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
                          _order.checkIn + " ~ " + _order.checkOut,
                          style: Theme.of(context).textTheme.headline5.copyWith(
                                color: Colors.black,
                              ),
                        ),
                        Row(
                          children: [
                            Text(
                              _order.peoples,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(),
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
}
