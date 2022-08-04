import 'package:app_test/models/viacep_model.dart';
import 'package:app_test/providers/viacep_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/utils/snackbar_util.dart';

// View conhece apenas Controllers
// Controller conhece apenas Providers
// Provider conhece o Repository

class HomeController extends GetxController with WidgetsBindingObserver {
  @override
  void onInit() {
    super.onInit();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) {
      setIsLocked(true);
    }
  }

  final provider = ViaCepProvider();

  bool isLocked = false;
  void setIsLocked(bool value) {
    isLocked = value;
    update();
  }

  String cep = '';
  void changeCep(String value) => cep = value;

  ViaCepModel? resultCep;
  Future<void> searchCep() async {
    final response = await provider.searchCep(cep);

    if (response.isSuccess) {
      resultCep = response.data;
    } else {
      showSnackbar(response.message!);
    }

    update();
  }

  Future<void> searchDefaultCep() async {
    final response = await provider.searchDefaultCep();

    if (response.isSuccess) {
      resultCep = response.data;
    } else {
      showSnackbar(response.message!);
    }

    update();
  }
}
