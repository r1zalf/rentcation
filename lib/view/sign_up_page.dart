part of 'view.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var _namecontroller = TextEditingController();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Registraion",
                  style: Theme.of(context).textTheme.headline3.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text("Sign Up to Countinue",
                    style: Theme.of(context).textTheme.headline5),
                SizedBox(
                  height: 35,
                ),
                TextField(
                  controller: _namecontroller,
                  decoration: InputDecoration(labelText: "Full Name"),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: "Email"),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: "Password"),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: Consumer2<AuthViewModel, UserViewModel>(
                    builder: (context, value, value2, _) {
                      return ElevatedButton(
                        onPressed: () async {
                          await context.read<AuthViewModel>().regist(
                                _emailController.text,
                                _passwordController.text,
                              );

                          if (value.registResult.isHasData) {
                            await context.read<UserViewModel>().setUser(
                                  value.uid,
                                  _namecontroller.text,
                                  _emailController.text,
                                  _passwordController.text,
                                );
                            Navigator.pushReplacementNamed(
                                context, route.mainRoute);
                          } else if (value.registResult.isError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                padding: EdgeInsets.all(8),
                                content: Text(
                                  'Email sudah terpakai nih!',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(color: Colors.white),
                                ),
                                duration: const Duration(seconds: 3),
                                backgroundColor: Colors.redAccent,
                              ),
                            );
                          }
                        },
                        child: value.registResult.isLoading
                            ? CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              )
                            : Text("Sign Up"),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ",
                        style: Theme.of(context).textTheme.headline5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Sign In",
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
