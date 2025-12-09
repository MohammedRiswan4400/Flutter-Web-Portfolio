import 'dart:async';
import 'dart:js' as js;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio_web/core/const.dart';
import 'package:flutter_portfolio_web/view/widgets/custome_icon_button.dart';
import 'package:flutter_portfolio_web/view/widgets/google_fonts.dart';
import 'package:flutter_portfolio_web/view/widgets/navigation_arrow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  late ScrollController _scrollController;
  late AnimationController _scrollAnimationController;
  late Animation<double> _scrollAnimation;

  final Duration _scrollDuration = const Duration(seconds: 25);

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animationImageController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000));
    // Timer(Duration(milliseconds: 200), () => animationController!.forward());
    animationImageController!.forward();
    animationController!.forward();

    _scrollController = ScrollController();
    _scrollAnimationController = AnimationController(
      vsync: this,
      duration: _scrollDuration,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startMarqueeAnimation();
    });
    super.initState();
  }

  void _startMarqueeAnimation() {
    // Check if the controller is attached to the view
    if (!_scrollController.hasClients) {
      // Re-schedule the check if clients are not yet ready (common on Flutter Web)
      Timer(const Duration(milliseconds: 100), _startMarqueeAnimation);
      return;
    }

    final double maxScroll = _scrollController.position.maxScrollExtent;

    // Check if there is anything to scroll
    if (maxScroll <= 0) return;

    // Define the Scroll Animation: from 0 (start) to maxScroll (end)
    _scrollAnimation = Tween<double>(
      begin: 0.0,
      end: maxScroll,
    ).animate(_scrollAnimationController)
      ..addListener(() {
        // Update the scroll position on every frame
        if (_scrollController.hasClients) {
          _scrollController.jumpTo(_scrollAnimation.value);
        }
      })
      ..addStatusListener((status) {
        // Create the infinite loop
        if (status == AnimationStatus.completed) {
          // Reset controller to start for next loop
          _scrollAnimationController.forward(from: 0.0);
        }
      });

    // Start the animation
    _scrollAnimationController.forward();
  }

  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage(WebImages.devRoom1Image), context);
    precacheImage(const AssetImage(WebImages.devRoom2Image), context);
    super.didChangeDependencies();
  }

  void dispose() {
    // Dispose all controllers to prevent memory leaks
    animationController?.dispose();
    animationImageController?.dispose();
    _scrollController.dispose();
    _scrollAnimationController.dispose();
    super.dispose();
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
    return Stack(
      children: [
        const Positioned(
            top: 0, bottom: 0, child: WidgetNavigationArrow(isBackArrow: true)),
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
                  SizedBox(
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
                          'Senior Flutter Developer & IoT Specialist',
                          context,
                        ),
                        SizedBox(
                          height: context.kHeight * 0.009,
                        ),
                        bodyText(
                            'I am a results-driven Flutter Developer with over 2.5+ years of experience architecting scalable mobile solutions for international clients across Canada, Oman, and India. My expertise lies in building complex ecosystems, not just standalone apps.',
                            context),
                        SizedBox(
                          height: context.kHeight * 0.02,
                        ),
                        subHeader('Skills & Expertise:', context),
                        SizedBox(
                          height: context.kHeight * 0.009,
                        ),
                        buildPoint('🏗️ White-Label Architecture', context),
                        Row(
                          children: [
                            25.horizontalSpace,
                            Expanded(
                              child: bodyText(
                                  'Architected a scalable ecosystem delivering 12+ production apps from a single codebase, reducing maintenance time by 70%.',
                                  context),
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        buildPoint('🔗 IoT & Bluetooth Integration', context),
                        Row(
                          children: [
                            25.horizontalSpace,
                            Expanded(
                              child: bodyText(
                                  'Expert in bridging Flutter with hardware (HC-05/Arduino). Specialized in handling real-time data streams, Hex parsing, and bi-directional communication.',
                                  context),
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        buildPoint('🚀 High-Performance SaaS', context),
                        Row(
                          children: [
                            25.horizontalSpace,
                            Expanded(
                              child: bodyText(
                                  'Built multi-tenant SaaS platforms (Sync 360) and optimized high-traffic apps with 5,000+ active users, ensuring 99.9% crash-free sessions.',
                                  context),
                            ),
                          ],
                        ), // // BulletList(contents: [
                        // //   'Collaborative Work: Experienced in working with cross-functional teams to deliver complete solutions.'
                        // // ]),
                        // buildPoint(
                        //     'Collaborative Work: Experienced in working with cross-functional teams to deliver complete solutions.',
                        //     context,
                        //      ),

                        50.verticalSpace,
                        GestureDetector(
                          onTap: () {
                            js.context.callMethod('open', [
                              'https://mohammedriswan4400.github.io/resume.pdf'
                            ]);
                          },
                          child: cvText(
                            'Get my CV',
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.,
              children: [
                header(context),
                8.verticalSpace,
                subHeader(
                  'Senior Flutter Developer & IoT Specialist',
                  context,
                ),
                8.verticalSpace,
                bodyText(
                    'I am a results-driven Flutter Developer with over 2.5+ years of experience architecting scalable mobile solutions for international clients across Canada, Oman, and India. My expertise lies in building complex ecosystems, not just standalone apps.',
                    context),
                8.verticalSpace,
                subHeader('Skills & Expertise:', context),
                8.verticalSpace,
                buildPoint('🏗️ White-Label Architecture', context),
                Row(
                  children: [
                    25.horizontalSpace,
                    Expanded(
                      child: bodyText(
                          'Architected a scalable ecosystem delivering 12+ production apps from a single codebase, reducing maintenance time by 70%.',
                          context),
                    ),
                  ],
                ),
                8.verticalSpace,
                buildPoint('🔗 IoT & Bluetooth Integration', context),
                Row(
                  children: [
                    25.horizontalSpace,
                    Expanded(
                      child: bodyText(
                          'Expert in bridging Flutter with hardware (HC-05/Arduino). Specialized in handling real-time data streams, Hex parsing, and bi-directional communication.',
                          context),
                    ),
                  ],
                ),
                8.verticalSpace,
                buildPoint('🚀 High-Performance SaaS', context),
                Row(
                  children: [
                    25.horizontalSpace,
                    Expanded(
                      child: bodyText(
                          'Built multi-tenant SaaS platforms (Sync 360) and optimized high-traffic apps with 5,000+ active users, ensuring 99.9% crash-free sessions.',
                          context),
                    ),
                  ],
                ), // // BulletList(contents: [
                // //   'Collaborative Work: Experienced in working with cross-functional teams to deliver complete solutions.'
                // // ]),
                // buildPoint(
                //     'Collaborative Work: Experienced in working with cross-functional teams to deliver complete solutions.',
                //     context,
                //      ),

                20.verticalSpace,
                GestureDetector(
                  onTap: () {
                    js.context.callMethod('open',
                        ['https://mohammedriswan4400.github.io/resume.pdf']);
                  },
                  child: cvText(
                    'Get my CV',
                    context,
                  ),
                ),
                SizedBox(
                  height: context.kHeight * 0.009,
                ),
              ],
            ),
            devRoomMobile(context),
            // SizedBox(height: context.kHeight * 0.020),
            // const Divider()
          ],
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return UbuntuGoogleFonts(
      text: 'About Me',
      size: 50.sp,
      weight: FontWeight.w600,
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
      size: 24.sp,
      weight: FontWeight.w600,
      color: Colors.white,
      textAlign: TextAlign.left,
    );
  }

  Widget bodyText(String text, BuildContext context) {
    return UbuntuGoogleFonts(
      text: text,
      size: 20.sp,
      weight: FontWeight.w300,
      color: Colors.white,
      textAlign: TextAlign.left,
    );
  }

  Widget subHeaderOne(String text, BuildContext context) {
    return UbuntuGoogleFonts(
      text: text,
      size: 30.sp,
      weight: FontWeight.w600,
      color: Colors.white,
      textAlign: TextAlign.left,
    );
  }

  Widget cvText(String text, BuildContext context) {
    return UbuntuGoogleFonts(
      text: text,
      size: 18.h,
      weight: FontWeight.w600,
      color: Colors.blue,
      textAlign: TextAlign.left,
    );
  }

  Widget devRoom(BuildContext context) {
    return FadeTransition(
        opacity: animationImageController!,
        child: const SizedBox(
            width: 300, // Adjust width
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                GlassSkillTile(
                  label: "Flutter",
                  assetPath: WebImages.flutterLogo,
                ),
                GlassSkillTile(
                  label: "Dart",
                  assetPath: WebImages.dartLogo,
                ),
                // GlassSkillTile(
                //   label: "IoT",
                //   assetPath: WebImages.flutterLogo,
                // ), // Arduino Icon
                GlassSkillTile(
                  label: "IoT",
                  assetPath: WebImages.bluetoothLogo,
                ),
                GlassSkillTile(
                  label: "Firebase",
                  assetPath: WebImages.firebaseLogo,
                ),
                GlassSkillTile(
                  label: "Figma",
                  assetPath: WebImages.figmaLogo,
                ),
                GlassSkillTile(
                  label: "Git & CI/CD",
                  assetPath: WebImages.githubLogo,
                ),
                GlassSkillTile(
                  label: "Supabase",
                  assetPath: WebImages.supabaseLogo,
                ),
                GlassSkillTile(
                  label: "Postman",
                  assetPath: WebImages.postmanLogo,
                ),
                GlassSkillTile(
                  label: "BLoC",
                  assetPath: WebImages.bloc,
                ),
                GlassSkillTile(
                  label: "App Store",
                  assetPath: WebImages.appleStoreLogo,
                ),
                GlassSkillTile(
                  label: "Play Store",
                  assetPath: WebImages.playstore,
                ),
              ],
            )));
  }

  Widget buildSkillChip(String label, String assetPath) {
    return Chip(
      avatar: Image.asset(assetPath, width: 20),
      label: Text(label, style: const TextStyle(color: Colors.white)),
      backgroundColor: Colors.grey[800], // Dark theme color
      padding: const EdgeInsets.all(10),
    );
  }

  Widget devRoomMobile(BuildContext context) {
    return FadeTransition(
        opacity: animationImageController!,
        child: SizedBox(
            // Removed const here since controller is dynamic
            width: double.infinity, // Adjust width
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              // 🛠️ NEW: Apply the ScrollController here
              controller: _scrollController,
              child: const Row(
                // Added const back to Row since children are constant
                // spacing is not a property of Row, assuming you use a spacing widget or defined one elsewhere
                // The spacing will be handled by the intrinsic width of the GlassSkillTile widgets
                children: [
                  GlassSkillTile(
                    label: "Flutter",
                    assetPath: WebImages.flutterLogo,
                  ),
                  GlassSkillTile(
                    label: "Dart",
                    assetPath: WebImages.dartLogo,
                  ),
                  GlassSkillTile(
                    label: "IoT",
                    assetPath: WebImages.bluetoothLogo,
                  ),
                  GlassSkillTile(
                    label: "Firebase",
                    assetPath: WebImages.firebaseLogo,
                  ),
                  GlassSkillTile(
                    label: "Figma",
                    assetPath: WebImages.figmaLogo,
                  ),
                  GlassSkillTile(
                    label: "Git & CI/CD",
                    assetPath: WebImages.githubLogo,
                  ),
                  GlassSkillTile(
                    label: "Supabase",
                    assetPath: WebImages.supabaseLogo,
                  ),
                  GlassSkillTile(
                    label: "Postman",
                    assetPath: WebImages.postmanLogo,
                  ),
                  GlassSkillTile(
                    label: "BLoC",
                    assetPath: WebImages.bloc,
                  ),
                  GlassSkillTile(
                    label: "App Store",
                    assetPath: WebImages.appleStoreLogo,
                  ),
                  GlassSkillTile(
                    label: "Play Store",
                    assetPath: WebImages.playstore,
                  ),
                ],
              ),
            )));
  }

  Widget buildPoint(
    String text,
    BuildContext context,
  ) {
    return
        // isMobile
        //     ?
        FadeTransition(
      opacity: animationController!,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(String.fromCharCode(0x2022),
              style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.white)),
          SizedBox(
            width: context.kWidth * 0.005,
          ),
          Expanded(
              child: UbuntuGoogleFonts(
            text: text,
            size: 24.sp,
            weight: FontWeight.w600,
            color: Colors.white,
            textAlign: TextAlign.left,
          )),
        ],
      ),
    );
    // : Row(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Text(String.fromCharCode(0x2022),
    //           style: TextStyle(
    //               fontSize:
    //                   isMobile ? getFondSize(false, context) * 1.5 : 20,
    //               color: Colors.white)),
    //       SizedBox(
    //         width: context.kWidth * 0.005,
    //       ),
    //       Expanded(
    //           child: UbuntuGoogleFonts(
    //         text: text,
    //         size: getFondSize(false, context),
    //         weight: FontWeight.w400,
    //         color: Colors.white,
    //         textAlign: TextAlign.left,
    //       )),
    //     ],
    //   );
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

  double getFondSizeSubHeader(BuildContext context) {
    double fontsize = context.kWidth > 950 && context.kHeight > 550 ? 12 : 8;
    return fontsize;
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

extension Spacing on int {
  Widget get verticalSpace => SizedBox(height: toDouble());
}

// 🎨 Widget for drawing the Liquid Glass Gradient Border
class GradientBorderPainter extends CustomPainter {
  final double borderRadius;
  final Duration duration;
  final Curve curve;

  GradientBorderPainter({
    required this.borderRadius,
    required this.duration,
    required this.curve,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Define the Gradient for the Light Reflection Border
    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.white.withOpacity(0.5), // Top-Left Bright Reflection
        Colors.white.withOpacity(0.1), // Mid-Point
        Colors.transparent, // Bottom-Right Fade
      ],
      stops: const [0.0, 0.4, 1.0],
    );

    // 2. Create the border painter
    final rect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(borderRadius),
    );

    final borderPaint = Paint()
      ..shader = gradient.createShader(rect.outerRect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0; // The border thickness

    // 3. Draw the RRect border
    canvas.drawRRect(rect, borderPaint);
  }

  // Ensures the border repaints when the size changes (e.g., on hover)
  @override
  bool shouldRepaint(covariant GradientBorderPainter oldDelegate) {
    return oldDelegate.borderRadius != borderRadius;
  }
}

// 💎 The Refactored Liquid Glass Skill Tile
class GlassSkillTile extends StatefulWidget {
  final String label;
  final String assetPath;

  const GlassSkillTile({
    super.key,
    required this.label,
    required this.assetPath,
  });

  @override
  State<GlassSkillTile> createState() => _GlassSkillTileState();
}

class _GlassSkillTileState extends State<GlassSkillTile> {
  bool isHovered = false;

  static const _borderRadius = 16.0;
  static const _animationDuration =
      Duration(milliseconds: 350); // Smoother transition
  static const _animationCurve = Curves.easeOutCubic; // Premium smooth curve

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: _animationDuration,
        curve: _animationCurve,
        // 4. Soft, Diffused Shadow for Depth
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isHovered ? 0.35 : 0.15),
              blurRadius: isHovered ? 25 : 15,
              spreadRadius: isHovered ? 4 : 2,
              offset: const Offset(0, 10), // Shadow for floating effect
            ),
          ],
        ),
        // Ensures the ClipRRect is outside the AnimatedContainer to clip the shadow
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_borderRadius),
          child: BackdropFilter(
            // 1. Stronger Frosted Glass Effect
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: AnimatedContainer(
              duration: _animationDuration,
              curve: _animationCurve,
              width: isHovered ? 140 : 100, // Expands on Hover
              height: 80, // Fixed Height
              padding: const EdgeInsets.symmetric(horizontal: 10),
              // Use CustomPaint to draw the Gradient Border
              child: CustomPaint(
                painter: GradientBorderPainter(
                  borderRadius: _borderRadius,
                  duration: _animationDuration,
                  curve: _animationCurve,
                ),
                child: Container(
                  // 3. Glossy Highlight Background Gradient
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        // Very light color at top-left for specular highlight
                        Colors.white.withOpacity(isHovered ? 0.3 : 0.2),
                        // Semi-transparent base color
                        Colors.white.withOpacity(0.1),
                        // More transparent at bottom-right for depth
                        Colors.white.withOpacity(0.05),
                      ],
                      stops: const [0.0, 0.4, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(_borderRadius),
                  ),
                  child: Center(
                    // Center the content vertically/horizontally
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Image.asset(
                            widget.assetPath,
                            width: 30,
                            height: 30,
                            fit: BoxFit.contain,
                          ),
                        ),
                        isHovered
                            ? Column(
                                children: [
                                  10.verticalSpace,
                                  AnimatedOpacity(
                                    opacity: isHovered ? 1.0 : 0.0,
                                    duration: _animationDuration,
                                    curve: _animationCurve,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        widget.label,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : 0.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
