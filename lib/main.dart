import 'dart:developer';

import 'package:app_test/shared/utils/api_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_widget.dart';
import 'presenter/home/home_controller.dart';

void main() {
  Get.lazyPut(() {
    final connect = GetConnect();
    connect.baseUrl = baseUrl;

    connect.httpClient.addResponseModifier((request, response) {
      log('====================');
      log('REQUEST: ${request.url}', name: 'GetConnect');
      log('RESPONSE: ${response.body}', name: 'GetConnect');
      log('====================');
      return response;
    });

    return connect;
  });

  Get.put(HomeController());

  runApp(const AppWidget());
}
