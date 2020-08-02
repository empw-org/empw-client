import 'package:empw/modules/api_response.dart';
import 'package:empw/modules/make_order_data.dart';
import 'package:empw/modules/order_summry_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderServices with ChangeNotifier {
  static const _api = 'https://api-empw.herokuapp.com/water_orders';

  Future<ApiResponse<OrderSummeryData>> makeOrder(
      MakeOrderData makeOrderData) async {
    String token = await _getTokenFromSharedPref();

    final response = await http.post(
      _api,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: json.encode(makeOrderData.toJson()),
    );
    print("from order service ${response.body} & ${response.statusCode}");
    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body);
      return ApiResponse<OrderSummeryData>(
          check: true,
          data: OrderSummeryData.fromJson(
              returnedOrder: jsonData,
              total: totalMoney(jsonData["amount"].toString())));
    } else if (response.statusCode == 400) {
      return ApiResponse<OrderSummeryData>(
          check: false,
          data: null,
          message:
              "You already have your 5 Pending requests, please wait to receive them or delete one.");
    }
    return ApiResponse<OrderSummeryData>(
        check: false, data: null, message: "Something went wrong");
  }

  Future getAllOrders() async {
    String token = await _getTokenFromSharedPref();
    final response = await http.get(
     _api,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    print("status : ${response.statusCode}");
    if (response.statusCode == 200) {
      print("here i am");
      final jsonData = json.decode(response.body);
      return jsonData;
    }else{
      print("fucked up");
      return null;
    }
  }

  String totalMoney(String amount) {
    return ((int.parse(amount) * 30) + 200).toString();
  }

  Future<String> _getTokenFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return token;
  }
}
