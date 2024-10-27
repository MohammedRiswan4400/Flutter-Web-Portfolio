import 'package:flutter/material.dart';

import 'view/home/screen_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio Web Flutter',
      home: ScreenHome(),
    );
  }
}
