import 'package:flutter/material.dart';

import 'view/home/screen_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Portfolio Web Flutter',
      home: ScreenHome(),
    );
  }
}
