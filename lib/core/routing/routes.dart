import 'package:flutter/material.dart';
import '../../features/login/presentation/pages/login_page.dart';
import '../const/route_constants.dart';

class RouteNavigator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final routesList = {
    RoutesList.loginRoute: (context) => LoginPage(),
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
    routes.add(MaterialPageRoute(builder: routesList[RoutesList.loginRoute]!));
    return routes;
  }

  static Route<dynamic> generateNamedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesList.initialRoute:
        {
          return MaterialPageRoute(builder: (context) => LoginPage());
        }
      case RoutesList.loginRoute:
        {
          return MaterialPageRoute(builder: (context) => LoginPage());
        }
      default:
        throw Exception('This route name does not exit');
    }
  }
}
