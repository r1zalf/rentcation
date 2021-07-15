part of 'view.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    AuthViewModel _authViewModel = context.read<AuthViewModel>();

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Consumer<AuthViewModel>(
            builder: (context, value, _) => Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: Theme.of(context).textTheme.headline3.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Text("Sign In to Countinue",
                        style: Theme.of(context).textTheme.headline5),
                    SizedBox(
                      height: 35,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: "Email"),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      decoration: InputDecoration(labelText: "Password"),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            await context.read<AuthViewModel>().login(
                                  _emailController.text,
                                  _passwordController.text,
                                );

                            if (_authViewModel.loginResult.isHasData) {
                              String uid = context.read<AuthViewModel>().uid;
                              if (uid != "") {
                                await context.read<UserViewModel>().getUer(uid);
                                await context.read<OrderViewModel>().getOrder(uid);
                              }
                            }

                            if (_authViewModel.loginResult.isError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Theme.of(context).errorColor,
                                  duration: Duration(seconds: 2),
                                  content:
                                      Text("Ada yang salah, periksa kembali"),
                                ),
                              );
                            }
                          }
                        },
                        child: value.loginResult.isLoading
                            ? CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              )
                            : Text("Sign In"),
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Start fresh now? ",
                            style: Theme.of(context).textTheme.headline5),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, route.signUpRoute);
                          },
                          child: Text(
                            "Sign Up",
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
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
        ),
      ),
    );
  }
}
