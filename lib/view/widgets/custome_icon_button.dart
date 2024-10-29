import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomeIconButton extends StatelessWidget {
  const CustomeIconButton(
      {super.key,
      required this.url,
      required this.iconData,
      required this.color});
  final String url;
  final IconData iconData;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final kHieght = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;
    return IconButton(
      icon: FaIcon(iconData),
      onPressed: () {
        openURL(url);
      },
      iconSize: kHieght * 0.05,
      color: color,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }

  void openURL(String url) async {
    final uri = Uri.parse(url);
    await canLaunchUrl(uri)
        ? await launchUrl(uri)
        : throw 'Could not luanch URL';
  }
}
