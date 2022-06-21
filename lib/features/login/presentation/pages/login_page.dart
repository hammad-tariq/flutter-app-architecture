import 'package:flutter/material.dart';
import '../../../../core/di/injection_container.dart';
import '../../data/repositories/login_repository_impl.dart';
import '../../domain/repositories/login_repository.dart';
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

  var loginCubit =
      LoginCubit(loginRepository: serviceLocator<LoginRepositoryImpl>());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: MaterialButton(
            onPressed: () {
              loginCubit.authenticateUserApi();
            },
            child: Text('LOGIN'),
          ),
        ));
  }

  void _loginUser() {
    _email = _emailController.text;
    _password = _passwordController.text;
    _emailController.clear();
    _passwordController.clear();
  }
}
