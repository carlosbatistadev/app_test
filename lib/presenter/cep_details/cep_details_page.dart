import 'package:app_test/presenter/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CepDetailsView extends StatelessWidget {
  const CepDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do CEP'),
        actions: [
          IconButton(
            onPressed: () {
              Get.find<HomeController>().searchDefaultCep();
            },
            icon: const Icon(
              Icons.refresh,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: GetBuilder<HomeController>(
            builder: (control) {
              return Text(control.resultCep.toString());
            },
          ),
        ),
      ),
    );
  }
}
