import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ViaCep'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/details-cep');
            },
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'CEP',
                  prefixIcon: Icon(Icons.house),
                  border: OutlineInputBorder(),
                ),
                onChanged: controller.changeCep,
              ),
              const SizedBox(height: 20),
              GetBuilder<HomeController>(
                builder: (_) => Text(controller.resultCep.toString()),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: controller.searchDefaultCep,
        label: const Text('Buscar'),
      ),
    );
  }
}
