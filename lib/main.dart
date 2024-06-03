import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_turntable_learning_app/page/MainPage.dart';
import 'package:flutter_turntable_learning_app/page/SettingPage.dart';

void main() {
  runApp(const ProviderScope(
    child: ProviderScope(child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
      routes: {
        '/setting_page': (context) => SettingPage(),
      },
    );
  }
}
