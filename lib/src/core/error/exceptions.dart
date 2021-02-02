import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// Represent exceptions from Server/Remote data source.
class RemoteException implements Exception {
  DioError dioError;

  RemoteException({@required this.dioError});
}

// Represent exceptions from Cache.
class LocalException implements Exception {}
