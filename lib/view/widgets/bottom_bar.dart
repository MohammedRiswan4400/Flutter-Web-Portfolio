import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio_web/view/widgets/custome_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WidgetBottomBar extends StatelessWidget {
  const WidgetBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final kHieght = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 3,
            width: kWidth * 0.9,
            color: Colors.white,
          ),
        ),
        Container(
          height: kHieght * 0.05,
          child: Padding(
            padding: EdgeInsets.only(left: kWidth * 0.05, right: kWidth * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CustomeIconButton(
                        url: 'https://github.com/MohammedRiswan4400',
                        iconData: FontAwesomeIcons.github,
                        color: Colors.white),
                    SizedBox(
                      width: kWidth * 0.021,
                    ),
                    const CustomeIconButton(
                        url:
                            'https://www.linkedin.com/in/mohammed-riswan-mt?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app',
                        iconData: FontAwesomeIcons.linkedin,
                        color: Colors.white),
                    SizedBox(
                      width: kWidth * 0.021,
                    ),
                    const CustomeIconButton(
                        url: 'https://github.com/MohammedRiswan4400',
                        iconData: FontAwesomeIcons.instagram,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ],
                ),
                const Text(
                  'Made with Flutter Web \u00a9 2024',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
