import 'package:flutter/material.dart';

class CustomeTab extends StatelessWidget {
  const CustomeTab({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Tab(
        child: Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ));
  }
}
