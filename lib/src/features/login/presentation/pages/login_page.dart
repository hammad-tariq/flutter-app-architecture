import 'package:flutter/material.dart';
import 'package:flutter_app/src/core/theme.dart';
import 'package:flutter_app/src/features/login/presentation/bloc/bloc.dart';
import 'package:flutter_app/src/features/login/presentation/widgets/input_field.dart';
import 'package:flutter_app/src/features/login/presentation/widgets/login_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
        child: Scaffold(
            resizeToAvoidBottomPadding: false,
            key: _scaffoldKey,
            backgroundColor: Theme.of(context).primaryColor,
            body: DecoratedBox(
                decoration: BoxDecoration(color: Theme.of(context).canvasColor),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0)),
                      child: Expanded(
                        child: Container(
                          child: ListView(
                            children: <Widget>[
                              Container(
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      left: 10,
                                      top: 10,
                                      child: IconButton(
                                        onPressed: () {
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
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                              ),
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                          Positioned(
                                            child: Container(
                                              child: Text(
                                                "LOGIN",
                                                style: TextStyle(
                                                  fontSize: 28,
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
                                      padding:
                                          EdgeInsets.only(bottom: 20, top: 60),
                                      child: inputWidget(
                                          Icon(Icons.email),
                                          "EMAIL",
                                          _emailController,
                                          false,
                                          context),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: inputWidget(
                                          Icon(Icons.lock),
                                          "PASSWORD",
                                          _passwordController,
                                          true,
                                          context),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      child: Container(
                                        child: LoginButton(
                                          text: "LOGIN",
                                          splashColor: whiteColor,
                                          fillColor: splashColor,
                                          highlightColor:
                                              Theme.of(context).highlightColor,
                                          textColor: whiteColor,
                                        
                                        ),
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          height: MediaQuery.of(context).size.height / 1.1,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ))));
  }

  void _loginUser() {
    _email = _emailController.text;
    _password = _passwordController.text;
    _emailController.clear();
    _passwordController.clear();
  }
}
