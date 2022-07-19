import 'package:app_test/presenter/cep_details/cep_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presenter/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/home',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/details-cep',
          page: () => const CepDetailsView(),
          transition: Transition.leftToRight,
        ),
      ],
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
