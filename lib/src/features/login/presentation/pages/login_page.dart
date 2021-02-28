import 'package:flutter/material.dart';
import 'package:flutter_app/src/core/util/theme.dart';
import 'package:flutter_app/src/core/util/theme_controller.dart';
import 'package:flutter_app/src/features/login/presentation/bloc/bloc.dart';
import 'package:flutter_app/src/features/login/presentation/widgets/input_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController _emailController = new TextEditingController();

  TextEditingController _passwordController = new TextEditingController();

  TextEditingController _nameController = new TextEditingController();

  String _email;

  String _password;

  String _displayName;

  bool _obscure = false;
  var themeController = GetIt.I<ThemeController>();
  ThemeMode _themeMode;

  @override
  Widget build(BuildContext context) {
    _themeMode = themeController.themeMode;

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        body: BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(loginRequestUserCase: null),
          child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
            if (state is Empty) {
              return buildLoginWidget();
            } else {
              return Container();
            }
          }),
        ));
  }

  // Login Page UI.
  Widget buildLoginWidget() {
    return ListView(
      children: <Widget>[
        Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 10,
                top: 10,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _emailController.clear();
                    _passwordController.clear();
                  },
                  icon: Icon(
                    Icons.close,
                    size: 30.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              )
            ],
          ),
          height: 50,
          width: 50,
        ),
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 140,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Align(
                        child: Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor),
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                    Positioned(
                      child: Container(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20, top: 60),
                child: inputWidget(Icon(Icons.email), "EMAIL", _emailController,
                    false, context),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: inputWidget(Icon(Icons.lock), "PASSWORD",
                    _passwordController, true, context),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  child: RaisedButton(
                    highlightElevation: 0.0,
                    elevation: 0.0,
                    color: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: secondaryColor,
                          fontSize: 20),
                    ),
                    onPressed: () {
                      setState(() {
                        if (_themeMode == ThemeMode.light) {
                          themeController.setThemeMode(ThemeMode.dark);
                        } else {
                          themeController.setThemeMode(ThemeMode.light);
                        }
                      });
                    },
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _loginUser() {
    _email = _emailController.text;
    _password = _passwordController.text;
    _emailController.clear();
    _passwordController.clear();
  }
}
