import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'views/data_page.dart';
import 'views/login_page.dart';

// https://zenn.dev/inari_sushio/articles/d3801e74d22c2d

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // 画面遷移をやりやすく
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textTheme: const TextTheme(
          subtitle1: TextStyle(fontSize: 45),
          bodyText2: TextStyle(fontSize: 30),
        ),
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/data', page: () => DataPage()),
      ],
    );
  }
}
