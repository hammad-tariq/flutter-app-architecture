import 'package:simple_connection_checker/simple_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl extends NetworkInfo {
  NetworkInfoImpl();

  @override
  Future<bool> get isConnected async {
    return await SimpleConnectionChecker.isConnectedToInternet();
  }
}
