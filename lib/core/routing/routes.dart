import 'package:developine_app/core/bloc/network_cubit.dart';
import 'package:developine_app/features/home/presentation/pages/home_page.dart';
import 'package:developine_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:developine_app/features/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/login/presentation/pages/login_page.dart';
import '../../features/search/presentation/pages/search_page.dart';
import '../const/route_constants.dart';
import '../di/injection_container.dart';

class RouteNavigator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  NavigatorState get _navigator => navigatorKey.currentState!;

  static final routesList = {
    RoutesList.initialRoute: (context) => SplashPage(),
    RoutesList.loginRoute: (context) => LoginPage(),
    RoutesList.homeRoute: (context) => HomePage(),
    RoutesList.searchRoute: (context) => SearchPage(),
  };

  static Future<dynamic>? pushNamed<Arguments>(
      {required String routeName, Arguments? arguments}) {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  static void pop() {
    navigatorKey.currentState?.pop();
  }

  static Future<dynamic>? pushRepalcementNamed<Arguments>(
      {required String routeName, Arguments? arguments}) {
    return navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
  }

  static List<Route<dynamic>> defaultGenerateInitialRoutes(
      String initialRouteName) {
    List<MaterialPageRoute> routes = [];
    routes
        .add(MaterialPageRoute(builder: routesList[RoutesList.initialRoute]!));
    return routes;
  }

  static Route<dynamic> generateNamedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesList.initialRoute:
        {
          return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
              BlocProvider<NetworkCubit>(
                  create: (_) => serviceLocator<NetworkCubit>()),
            ], child: SplashPage()),
          );
        }
      case RoutesList.loginRoute:
        {
          return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
              BlocProvider<LoginCubit>(
                  create: (_) => serviceLocator<LoginCubit>()),
            ], child: LoginPage()),
          );
        }
      case RoutesList.homeRoute:
        {
          return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
              BlocProvider<LoginCubit>(
                  create: (_) => serviceLocator<LoginCubit>()),
            ], child: HomePage()),
          );
        }

      case RoutesList.searchRoute:
        {
          return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
              BlocProvider<LoginCubit>(
                  create: (_) => serviceLocator<LoginCubit>()),
            ], child: SearchPage()),
          );
        }
      default:
        throw Exception('This route name does not exit');
    }
  }
}
