import 'package:flutter/material.dart';
import 'package:flutter_portfolio_web/view/home/home.dart';
import 'package:flutter_portfolio_web/view/home/screen_about.dart';
import 'package:flutter_portfolio_web/view/widgets/google_fonts.dart';

class BulletPoints extends StatelessWidget {
  const BulletPoints(
      {super.key, required this.text, required this.animationController});

  final String text;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: Row(
        children: [
          Text(
            String.fromCharCode(0x2022),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: context.kWidth * 0.01,
          ),
          UbuntuGoogleFonts(
            text: text,
            size: 15, //getFondSize(false, context),
            weight: FontWeight.w400,
            color: Colors.white,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
