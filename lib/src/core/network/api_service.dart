import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/core/network/network_client.dart';
import 'package:flutter_app/src/core/util/constants.dart';

class ApiService {
  final NetworkClient networkClient;

  ApiService({@required this.networkClient});

  // LOGIN
  Future<Response> loginApiRequest(Map<String, String> params) async {
    return await networkClient.get(LOGIN_API, params);
  }

  // SIGNUP
  Future<Response> signUpApiRequest(Map<String, String> params) async {
    return await networkClient.post(LOGIN_API, params);
  }

  // FORGOT PASSWORD
  Future<Response> forgotPasswordApiRequest(Map<String, String> params) async {
    return await networkClient.post(LOGIN_API, params);
  }

  // CHANGE PASSWORD
  Future<Response> changePasswordApiRequest(Map<String, String> params) async {
    return await networkClient.post(LOGIN_API, params);
  }

  // NOTIFICATION SETTINGS
  Future<Response> notificationSettingsApiRequest(
      Map<String, String> params) async {
    return await networkClient.post(LOGIN_API, params);
  }

  // MY CART
  Future<Response> getMyCartApiRequest(Map<String, String> params) async {
    return await networkClient.post(LOGIN_API, params);
  }

  // SEARCH API
  Future<Response> searchApiRequest(Map<String, String> params) async {
    return await networkClient.post(LOGIN_API, params);
  }

  // GET ALL CATEGORIES
  Future<Response> getCategoriesApiRequest(Map<String, String> params) async {
    return await networkClient.post(LOGIN_API, params);
  }

  // GET LISTING BY CATEGORY
  Future<Response> getCategoryListingApiRequest(
      Map<String, String> params) async {
    return await networkClient.post(LOGIN_API, params);
  }

  // GET PRODUCT DETAILS
  Future<Response> getListingDetailsApiRequest(
      Map<String, String> params) async {
    return await networkClient.post(LOGIN_API, params);
  }

  // CREATE NEW ORDER / CHECKOUT
  Future<Response> submitOrderApiRequest(Map<String, String> params) async {
    return await networkClient.post(LOGIN_API, params);
  }

  // GET ORDER HISTORY
  Future<Response> getOrderHistoryApiRequest(Map<String, String> params) async {
    return await networkClient.post(LOGIN_API, params);
  }

  // ADD SHIPPING ADDRESS
  Future<Response> addShippingAddressApiRequest(
      Map<String, String> params) async {
    return await networkClient.post(LOGIN_API, params);
  }

  // ADD PAYMENT DETAILS
  Future<Response> addPaymentDetailsApiRequest(
      Map<String, String> params) async {
    return await networkClient.post(LOGIN_API, params);
  }

  // GET FAQ's
  Future<Response> getFaqsApiRequest(Map<String, String> params) async {
    return await networkClient.post(LOGIN_API, params);
  }

  // GET Support Email/Phone/Helpline
  Future<Response> getContactDetailsApiRequest(
      Map<String, String> params) async {
    return await networkClient.post(LOGIN_API, params);
  }
}
