part of 'view.dart';

class HomeProfilepage extends StatelessWidget {
  const HomeProfilepage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<UserViewModel>(
        builder: (context, value, _) => Column(
          children: [
            Container(
              padding: EdgeInsets.all(24),
              width: double.infinity,
              height: 130,
              color: Theme.of(context).primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value.userModel.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        value.userModel.email,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<AuthViewModel>().logout();
                    },
                    child: Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
