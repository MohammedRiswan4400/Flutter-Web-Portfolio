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
}

void openURL(String url) async {
  // 1. **THE CRITICAL CHECK**
  if (url.isEmpty) {
    print('Warning: Cannot launch URL because the link is empty.');
    // Do not throw; just return gracefully.
    return;
  }

  final uri = Uri.parse(url);

  // 2. Use the most robust mode for web external links
  const launchMode = LaunchMode.externalNonBrowserApplication;

  if (await canLaunchUrl(uri)) {
    final success = await launchUrl(uri, mode: launchMode);

    if (!success) {
      print('Launch failed even with explicit mode: $url');
    }
  } else {
    // This will now only trigger for valid, non-empty URLs that the system truly can't handle.
    print('Failed to launch URL: The URL failed the canLaunchUrl check: $url');
    // You might throw an error here if you want to enforce that all links must work.
  }
}
