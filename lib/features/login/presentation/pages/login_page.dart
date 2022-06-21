import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/util/theme_controller.dart';
import '../../data/repositories/login_repository_impl.dart';
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
  var themeController = GetIt.I<ThemeController>();
  late ThemeMode _themeMode;
  LoginCubit loginCubit =
      LoginCubit(loginRepository: GetIt.I<LoginRepositoryImpl>());

  @override
  Widget build(BuildContext context) {
    _themeMode = themeController.themeMode;
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
