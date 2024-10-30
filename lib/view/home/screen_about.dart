import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_portfolio_web/core/const.dart';
import 'package:flutter_portfolio_web/view/home/screen_resume.dart';
import 'package:flutter_portfolio_web/view/widgets/custome_icon_button.dart';
import 'package:flutter_portfolio_web/view/widgets/google_fonts.dart';
import 'package:flutter_portfolio_web/view/widgets/navigation_arrow.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScreenAbout extends StatefulWidget {
  const ScreenAbout({super.key});

  @override
  State<ScreenAbout> createState() => _ScreenAboutState();
}

class _ScreenAboutState extends State<ScreenAbout>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  AnimationController? animationImageController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animationImageController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000));
    // Timer(Duration(milliseconds: 200), () => animationController!.forward());
    animationImageController!.forward();
    animationController!.forward();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage(WebImages.devRoom1Image), context);
    precacheImage(const AssetImage(WebImages.devRoom2Image), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 715) {
          return desktopView(context);
        } else {
          return mobilePhoneView(context);
          // MobilePhoneView(
          //   screenWidth: kWidth,
          //   childrenTabs: contentview.map((e) => e.tab).toList(),
          // );
        }
      },
    );
  }

  Widget desktopView(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          const Positioned(
              top: 0,
              bottom: 0,
              child: WidgetNavigationArrow(isBackArrow: true)),
          const Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              child: WidgetNavigationArrow(isBackArrow: false)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.kWidth * 0.05,
              vertical: context.kWidth * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: context.kWidth * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: context.kWidth * 0.45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.,
                        children: [
                          header(context),
                          SizedBox(
                            height: context.kWidth * 0.01,
                          ),
                          subHeader(
                            'I\'m a skilled Flutter developer with experience in building responsive, cross-platform applications that look great and perform smoothly on both iOS and Android devices. I enjoy bringing ideas to life through clean, efficient code and have a keen eye for details that make user experiences intuitive and enjoyable.',
                            context,
                          ),
                          SizedBox(
                            height: context.kHeight * 0.009,
                          ),
                          subHeader(
                            'In my projects, I’ve tackled various technical challenges, from integrating real-time video calling and payment systems to developing custom animations and seamless UI transitions. My approach emphasizes maintainable code, scalability, and staying current with the latest advancements in Flutter and Dart.',
                            context,
                          ),
                          SizedBox(
                            height: context.kHeight * 0.02,
                          ),
                          subHeaderOne('Skills & Expertise:', context),
                          SizedBox(
                            height: context.kHeight * 0.009,
                          ),
                          buildPoint(
                              'Cross-Platform Development: Proficient in delivering consistent user experiences across iOS and Android.',
                              context,
                              false),
                          buildPoint(
                              'UI/UX Implementation: Strong focus on creating smooth, interactive, and user-friendly interfaces.',
                              context,
                              false),
                          buildPoint(
                              'Complex Integrations: Hands-on experience with video calling, payment gateways, and live streaming.',
                              context,
                              false),
                          // BulletList(contents: [
                          //   'Collaborative Work: Experienced in working with cross-functional teams to deliver complete solutions.'
                          // ]),
                          buildPoint(
                              'Collaborative Work: Experienced in working with cross-functional teams to deliver complete solutions.',
                              context,
                              false),
                          SizedBox(
                            height: context.kHeight * 0.02,
                          ),
                          subHeader(
                            'With a dedication to constant learning, I’m always on the lookout for new techniques and tools to enhance app performance and design. My goal is to create robust applications that meet both user expectations and business needs.',
                            context,
                          ),
                          SizedBox(
                            height: context.kHeight * 0.02,
                          ),
                          GestureDetector(
                            onTap: () {
                              // bottomSheetResume(context);
                              // Navigator.of(context).push(MaterialPageRoute(
                              //   builder: (context) {
                              //     return ScreenResume();
                              //   },
                              // ));
                            },
                            child: cvText(
                              'Here is my CV',
                              context,
                            ),
                          ),
                          SizedBox(
                            height: context.kHeight * 0.009,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: context.kWidth * 0.45,
                      child: devRoom(context),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget mobilePhoneView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.kWidth * 0.02,
        vertical: context.kWidth * 0.02,
      ),
      child: SizedBox(
        height: context.kHeight,
        // color: Colors.amber,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            header(context),
            SizedBox(
              height: context.kWidth * 0.01,
            ),
            subHeader(
              'I\'m a skilled Flutter developer with experience in building responsive, cross-platform applications that look great and perform smoothly on both iOS and Android devices. I enjoy bringing ideas to life through clean, efficient code and have a keen eye for details that make user experiences intuitive and enjoyable.',
              context,
            ),
            SizedBox(
              height: context.kHeight * 0.009,
            ),
            subHeader(
              'In my projects, I’ve tackled various technical challenges, from integrating real-time video calling and payment systems to developing custom animations and seamless UI transitions. My approach emphasizes maintainable code, scalability, and staying current with the latest advancements in Flutter and Dart.',
              context,
            ),
            SizedBox(
              height: context.kHeight * 0.02,
            ),
            subHeaderOne('Skills & Expertise:', context),
            SizedBox(
              height: context.kHeight * 0.009,
            ),
            buildPoint(
                'Cross-Platform Development: Proficient in delivering consistent user experiences across iOS and Android.',
                context,
                true),
            buildPoint(
                'UI/UX Implementation: Strong focus on creating smooth, interactive, and user-friendly interfaces.',
                context,
                true),
            buildPoint(
                'Complex Integrations: Hands-on experience with video calling, payment gateways, and live streaming.',
                context,
                true),
            buildPoint(
                'Collaborative Work: Experienced in working with cross-functional teams to deliver complete solutions.',
                context,
                true),
            SizedBox(
              height: context.kHeight * 0.02,
            ),
            subHeader(
              'With a dedication to constant learning, I’m always on the lookout for new techniques and tools to enhance app performance and design. My goal is to create robust applications that meet both user expectations and business needs.',
              context,
            ),
            SizedBox(
              height: context.kHeight * 0.02,
            ),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger(child: Text('data'));
                // bottomSheetResume(context);
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) {
                //     return ScreenResume();
                //   },
                // ));
              },
              child: cvText(
                'Here is my CV',
                context,
              ),
            ),
            SizedBox(
              height: context.kHeight * 0.02,
            ),
            devRoomMobile(context),
            SizedBox(height: context.kHeight * 0.020),
            const Divider()
          ],
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return UbuntuGoogleFonts(
      text: 'About Me',
      size: getFondSize(true, context),
      weight: FontWeight.w500,
      color: Colors.white,
    );
  }

  Widget aboutSocialMedia(BuildContext context) {
    return Row(
      children: [
        const CustomeIconButton(
            url: 'https://github.com/MohammedRiswan4400',
            iconData: FontAwesomeIcons.github,
            color: Colors.white),
        SizedBox(
          width: context.kWidth * 0.021,
        ),
        const CustomeIconButton(
            url: 'https://github.com/MohammedRiswan4400',
            iconData: FontAwesomeIcons.linkedin,
            color: Colors.white),
        SizedBox(
          width: context.kWidth * 0.021,
        ),
        const CustomeIconButton(
            url: 'https://github.com/MohammedRiswan4400',
            iconData: FontAwesomeIcons.instagram,
            color: Color.fromARGB(255, 255, 255, 255)),
      ],
    );
  }

  Widget subHeader(String text, BuildContext context) {
    return UbuntuGoogleFonts(
      text: text,
      size: getFondSize(false, context),
      weight: FontWeight.w400,
      color: Colors.white,
      textAlign: TextAlign.left,
    );
  }

  Widget subHeaderOne(String text, BuildContext context) {
    return UbuntuGoogleFonts(
      text: text,
      size: getFondSize(false, context),
      weight: FontWeight.w600,
      color: Colors.white,
      textAlign: TextAlign.left,
    );
  }

  Widget cvText(String text, BuildContext context) {
    return UbuntuGoogleFonts(
      text: text,
      size: getFondSize(false, context),
      weight: FontWeight.w600,
      color: Colors.blue,
      textAlign: TextAlign.left,
    );
  }

  Widget devRoom(BuildContext context) {
    return FadeTransition(
      opacity: animationImageController!,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            WebImages.devRoom1Image,
            height: devRoomSize(context),
          ),
          context.kWidth > 950
              ? const SizedBox()
              : Image.asset(
                  WebImages.devRoom2Image,
                  height: devRoomSize(context),
                )
        ],
      ),
    );
  }

  Widget devRoomMobile(BuildContext context) {
    return Center(
      child: Image.asset(
        WebImages.devRoom1Image,
        height: devRoomMobileSize(context),
      ),
    );
  }

  Widget buildPoint(String text, BuildContext context, bool isMobile) {
    return isMobile
        ? SlideTransition(
            position: Tween<Offset>(
                    begin: const Offset(0.5, 0), end: const Offset(0, 0))
                .animate(animationController!),
            child: FadeTransition(
              opacity: animationController!,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(String.fromCharCode(0x2022),
                      style: TextStyle(
                          fontSize:
                              isMobile ? getFondSize(false, context) * 1.5 : 20,
                          color: Colors.white)),
                  SizedBox(
                    width: context.kWidth * 0.005,
                  ),
                  Expanded(
                      child: UbuntuGoogleFonts(
                    text: text,
                    size: getFondSize(false, context),
                    weight: FontWeight.w400,
                    color: Colors.white,
                    textAlign: TextAlign.left,
                  )),
                ],
              ),
            ),
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(String.fromCharCode(0x2022),
                  style: TextStyle(
                      fontSize:
                          isMobile ? getFondSize(false, context) * 1.5 : 20,
                      color: Colors.white)),
              SizedBox(
                width: context.kWidth * 0.005,
              ),
              Expanded(
                  child: UbuntuGoogleFonts(
                text: text,
                size: getFondSize(false, context),
                weight: FontWeight.w400,
                color: Colors.white,
                textAlign: TextAlign.left,
              )),
            ],
          );
  }

  // Future bottomSheetResume(BuildContext context) {
  //   return showDialog(
  //     context: context,
  //     builder: (context) {
  //       return SfPdfViewer.asset(
  //         // 'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
  //         'assets/Mohammed Riswan.pdf',
  //         // key: _pdfViewerKey,
  //       );
  //     },
  //   );
  // }

  double getFondSize(bool isHeader, BuildContext context) {
    double fontsize = context.kWidth > 950 && context.kHeight > 550 ? 14 : 8;
    return isHeader ? fontsize * 2.25 : fontsize;
  }

  double devRoomSize(BuildContext context) {
    double imageSize =
        context.kWidth > 950 ? context.kHeight / 1.6 : context.kHeight / 3;
    return imageSize;
  }

  double devRoomMobileSize(BuildContext context) {
    double imageSize =
        context.kHeight < 750 ? context.kHeight * 0.09 : context.kHeight / 4;
    return imageSize;
  }
}

// class ScreenUtil {
//   static double getHeight(BuildContext context) {
//     return MediaQuery.of(context).size.height;
//   }

//   static double getWidth(BuildContext context) {
//     return MediaQuery.of(context).size.width;
//   }
// }

extension ScreenUtil on BuildContext {
  double get kHeight => MediaQuery.of(this).size.height;
  double get kWidth => MediaQuery.of(this).size.width;
}
