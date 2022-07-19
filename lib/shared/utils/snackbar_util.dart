import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackbar(String message) {
  Get.rawSnackbar(
    message: message,
    margin: const EdgeInsets.all(10),
    borderRadius: 12,
  );
}
