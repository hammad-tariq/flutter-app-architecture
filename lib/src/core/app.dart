import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_app/src/core/theme.dart';
import 'package:flutter_app/src/features/listing/presentation/pages/listing_page.dart';
import 'package:flutter_app/src/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  // Adding English and Arabic support.
  var supportedLocales = [const Locale('en', ''), const Locale('ar', '')];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
        child: MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate

            ],
            supportedLocales: supportedLocales,
            title: 'Demo App',
            home: ListingPage(),
            debugShowCheckedModeBanner: false,
            theme: lightTheme));
  }
}
