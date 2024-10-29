import 'package:flutter/material.dart';
import 'package:flutter_portfolio_web/view/core/const.dart';
import 'package:flutter_portfolio_web/view/home/screen_about.dart';
import 'package:flutter_portfolio_web/view/widgets/google_fonts.dart';
import 'package:flutter_portfolio_web/view/widgets/navigation_arrow.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: Duration(microseconds: 3000));
    animationController!.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final kHeight = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 715) {
          return desktopView(kWidth);
        } else {
          return mobilePhoneView();
          // MobilePhoneView(
          //   screenWidth: kWidth,
          //   childrenTabs: contentview.map((e) => e.tab).toList(),
          // );
        }
      },
    );
  }

  Widget desktopView(double screenWidth) {
    final kHeight = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        const Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: WidgetNavigationArrow(isBackArrow: false)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: screenWidth * 0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header(getFondSize(true)),
                  SizedBox(height: kHeight * 0.1),
                  subHeader('Flutter Enthusiast', getFondSize(false)),
                  SizedBox(height: kHeight * 0.01),
                  subHeader('App Developer', getFondSize(false)),
                  SizedBox(height: kHeight * 0.01),
                  subHeader('Figma Designer', getFondSize(false)),
                  SizedBox(height: kHeight * 0.01),
                  subHeader('Photographer', getFondSize(false)),
                  SizedBox(height: kHeight * 0.01),
                  subHeader('Influancer', getFondSize(false)),
                ],
              ),
            ),
            SizedBox(
              width: kWidth * 0.03,
            ),
            picture()
          ],
        ),
      ],
    );
  }

  Widget mobilePhoneView() {
    return Column(
      children: [
        picture(),
        SizedBox(height: context.kHeight * 0.05),
        header(30),
        SizedBox(height: context.kHeight * 0.025),
        subHeader(
            'Flutter Enthusiast - App Developer - Figma Designer - Photographer - Influancer',
            15),
        SizedBox(height: context.kHeight * 0.020),
        const Divider()
      ],
    );
  }

  Widget header(double fontSize) {
    return RichText(
      text: TextSpan(
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: fontSize,
          ),
          children: [
            const TextSpan(text: 'Hi, my name is \n'),
            TextSpan(
              text: 'Mohammed Riswan',
              style: GoogleFonts.jetBrainsMono(
                textStyle: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                  color: Colors.amberAccent,
                ),
              ),
              // TextStyle(
              //     color: Colors.amberAccent, fontWeight: FontWeight.bold),
            ),
            const TextSpan(text: '!'),
          ]),
    );
  }

  Widget subHeader(String text, double fontSize) {
    return FadeTransition(
      opacity: animationController!,
      child: CustomeGoogleFont(
        text: text,
        size: fontSize,
        weight: FontWeight.w500,
        color: Colors.grey,
      ),
    );
    // Text(
    //   text,
    //   style: const TextStyle(fontSize: 25, color: Colors.grey),
    // );
  }

  Widget picture() {
    return SizedBox(
      height: getImageSizer(),
      width: getImageSizer(),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(getImageSizer() / 2),
          child: Image.asset(
            WebImages.profileImage,
            fit: BoxFit.cover,
          )),
    );
  }

  double getFondSize(bool isHeader) {
    double fontsize = context.kWidth > 950 && context.kHeight > 550 ? 25 : 20;
    return isHeader ? fontsize * 2.25 : fontsize;
  }

  double getImageSizer() {
    if (context.kWidth > 1600 && context.kHeight > 800) {
      return 400;
    } else if (context.kWidth > 1300 && context.kHeight > 600) {
      return 350;
    } else if (context.kWidth > 1000 && context.kHeight > 400) {
      return 300;
    } else {
      return 250;
    }
  }
}
