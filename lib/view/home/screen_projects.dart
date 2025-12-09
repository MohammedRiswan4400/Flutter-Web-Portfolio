import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_portfolio_web/core/const.dart';
import 'package:flutter_portfolio_web/view/home/screen_about.dart';
import 'package:flutter_portfolio_web/model/model_project.dart';
import 'package:flutter_portfolio_web/view/widgets/google_fonts.dart';
import 'package:flutter_portfolio_web/view/widgets/navigation_arrow.dart';
import 'package:flutter_portfolio_web/view/widgets/project_details.dart';
import 'package:flutter_portfolio_web/view/widgets/project_image.dart';

class ScreenProjects extends StatefulWidget {
  const ScreenProjects({super.key});

  @override
  State<ScreenProjects> createState() => _ScreenProjectsState();
}

class _ScreenProjectsState extends State<ScreenProjects>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    animationController!.forward();
    super.initState();
  }

  final CardSwiperController controller = CardSwiperController();

  int selecTedIndex = 0;
  int selecTedIndexMobile = 0;

  List<ProjectModel> projects = [
    ProjectModel(
        title: 'IoT Bluetooth Terminal & Controller',
        subTitle:
            'A custom-built IoT controller app bridging Flutter with Arduino hardware via Bluetooth Classic (HC-05), featuring real-time data visualization.',
        points: [
          'Bi-Directional Communication: Enables sending commands and receiving real-time sensor data streams simultaneously.',
          'Custom Protocol: Implemented efficient parsing for String and HEX data formats.',
          'Terminal Interface: Built a developer-friendly chat-like terminal for debugging hardware responses.'
        ],
        tech: [
          'Flutter',
          'Dart',
          'Bluetooth Classic',
          'Arduino (C++)',
          'Stream Handling'
        ],
        playStore: '',
        gitHub: 'https://github.com/MohammedRiswan4400/flutter_hc05_controller',
        imageURL: 'assets/logos/bluetooth-app-logo.png'),
    ProjectModel(
        title: 'Rays Sports Network Ecosystem',
        subTitle:
            'An enterprise-grade white-label solution powering 12+ custom club apps (including Ramblers, Blazing Bulls) from a single unified codebase.',
        points: [
          'Scalable Architecture: Designed a system where one codebase generates 12+ unique apps with different branding, reducing maintenance time by 70%.',
          'Complex Modules: Integrated E-commerce for sports gear, Facility Booking, and Event Management.',
          'Role-Based Access: Custom dashboards for Admins, Players, and Fans.'
        ],
        tech: [
          'Flutter',
          'Clean Architecture',
          'BLoC',
          'REST APIs',
          'White-Labeling'
        ],
        playStore:
            'https://play.google.com/store/apps/developer?id=Rays+Sports+Network+Inc.',
        gitHub: '',
        imageURL: 'assets/logos/rays-logo.png'),
    ProjectModel(
        title: 'Sync 360 - SaaS Sports Management',
        subTitle:
            'A multi-tenant SaaS platform designed for sports organizations, featuring dynamic organization switching and role management.',
        points: [
          'Multi-Tenancy: Allows users to switch between different organizations (Academies/Clubs) seamlessly within a single app.',
          'Dynamic Dashboards: UI adapts based on the selected sport (Cricket/Football) and user role.',
          'Performance Tracking: Comprehensive tools for coaches to track athlete progress.'
        ],
        tech: [
          'Flutter',
          'SaaS Architecture',
          'Clean Architecture',
          'BLoC',
          'REST APIs',
          'Multi-tenancy'
        ],
        playStore:
            'https://play.google.com/store/apps/details?id=com.sync.rays',
        gitHub: '',
        imageURL: 'assets/logos/sync-logo.png'),
    ProjectModel(
        title: 'Convosys - Convention Management',
        subTitle:
            'A subscription-based SaaS product streamlining operations for convention centers, including booking, billing, and staff management.',
        points: [
          'Complex Booking Engine: Handles slot availability, conflict detection, and calendar management.',
          'Subscription Model: Integrated recurring payment logic for venue owners.',
          'Staff Tracking: Features for managing employee shifts and tasks.'
        ],
        tech: [
          'Flutter',
          'Business Logic',
          'Supabase',
          'Push Notification',
        ],
        playStore:
            'https://play.google.com/store/apps/details?id=com.convosys.app&pcampaignid=web_share',
        gitHub: '',
        imageURL: 'assets/logos/convosys-logo.png'),
    ProjectModel(
        title: 'E.A.MUNC Conference App',
        subTitle:
            'The official conference management application for Indian School Al Ghubra (Oman), facilitating their annual Model United Nations event.',
        points: [
          'Global Deployment: Successfully managed the end-to-end release process on both Google Play Store and Apple App Store, ensuring compliance with international guidelines.'
        ],
        tech: [
          'Flutter',
          'Git',
          'Play Store Deployment',
          'App Store Deployment'
        ],
        playStore:
            'https://play.google.com/store/apps/details?id=com.eamuncnew.org.ea_munc.ea_munc_new',
        gitHub: '',
        imageURL: 'assets/logos/eamunc-logo.png'),
  ];
  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage(WebImages.netflixImage), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 715) {
          return desktopView(context);
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

  Widget desktopView(BuildContext context) {
    double space = context.kHeight * 0.03;
    List<Widget> images = List.generate((projects.length * 2) - 1, (index) {
      if (index.isEven) {
        // index = 0, 2, 4, 6, 8 (5 projects)
        // index ~/ 2 = 0, 1, 2, 3, 4 (Accesses all 5 projects)
        return ProjectImage(
            isSelected: selecTedIndex == index ~/ 2 ? true : false,
            project: projects[index ~/ 2],
            onPressed: () {
              updateIndex(index ~/ 2);
            });
      } else {
        // index = 1, 3, 5, 7 (4 spaces)
        return SizedBox(
          height: space,
        );
      }
    });

    return Stack(
      children: [
        const Positioned(
            top: 0, bottom: 0, child: WidgetNavigationArrow(isBackArrow: true)),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.kWidth * 0.05,
            vertical: context.kWidth * 0.02,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    // color: Colors.blue,
                    height: context.kHeight / 1.4,
                    child: SingleChildScrollView(
                      child: Column(
                        children: images,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: space,
                  // ),
                  Expanded(
                      child: ProjectDetails(project: projects[selecTedIndex]))
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget mobilePhoneView() {
    return Container(
      height: context.kHeight / 1.2,
      // color: Colors.amber,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.kWidth * 0.02,
          vertical: context.kWidth * 0.02,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(context),
              SizedBox(
                height: context.kWidth * 0.61,
                width: context.kWidth * 0.5,
                child:
                    // Flexible(
                    //   child:
                    CardSwiper(
                        controller: controller,
                        cardsCount: projects.length,
                        onSwipe: (index, previousIndex, direction) {
                          setState(() {
                            index == projects.length - 1
                                ? selecTedIndexMobile = 0
                                : selecTedIndexMobile = index + 1;
                            animationController!.reset();
                            animationController!.forward();
                            log(index.toString());
                          });
                          return true; // Allow the swipe
                        },
                        // onUndo: _onUndo,
                        numberOfCardsDisplayed: projects.length,
                        backCardOffset: const Offset(50, -10),
                        padding: const EdgeInsets.all(24.0),
                        cardBuilder: (
                          context,
                          index,
                          horizontalThresholdPercentage,
                          verticalThresholdPercentage,
                        ) {
                          return ProjectImageOnMobile(project: projects[index]);
                        }),
              ),
              // ),
              FadeTransition(
                  opacity: animationController!,
                  child: ProjectDetails(project: projects[selecTedIndexMobile]))
            ],
          ),
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return UbuntuGoogleFonts(
      text: 'Projects',
      size: getFondSize(true, context),
      weight: FontWeight.w500,
      color: Colors.white,
    );
  }

  void updateIndex(int newIndex) {
    setState(() {
      selecTedIndex = newIndex;
    });
  }
}

double getFondSize(bool isHeader, BuildContext context) {
  double fontsize = context.kWidth > 950 && context.kHeight > 550 ? 14 : 8;
  return isHeader ? fontsize * 2.25 : fontsize;
}
