import 'package:developine_app/core/bloc/network_cubit.dart';
import 'package:developine_app/core/bloc/network_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/login_cubit.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController _emailController = new TextEditingController();

  TextEditingController _passwordController = new TextEditingController();

  TextEditingController _nameController = new TextEditingController();

  late String _email;

  late String _password;

  late String _displayName;

  bool _obscure = false;
  late ThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: MultiBlocListener(
        listeners: [
          BlocListener<NetworkCubit, NetworkState>(
            listener: (context, state) {
              var snackBar = SnackBar(
                content: Text(
                  state.message,
                  style: TextStyle(color: Colors.white),
                ),
              );
              // ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ],
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (oldState, newState) {},
          builder: (BuildContext context, state) {
            return Center();
          },
        ),
      ),
    );
  }

  void _loginUser() {
    _email = _emailController.text;
    _password = _passwordController.text;
    _emailController.clear();
    _passwordController.clear();
  }
}
