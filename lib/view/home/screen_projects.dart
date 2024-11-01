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
        title: 'CFA TVP',
        dencription:
            'I developed CFA TVP, a mobile application tailored for students of the Challengers Football Academy, using Flutter, Firebase, and the Provider package. The app enables students to easily track their personal progress with features like an improvement tracker, weekly performance charts, and highlights like the Performer of the Week. Additionally, users can stay updated with the latest academy news, including notable achievements, such as player selections for major events like the World Cup. This project emphasizes my ability to create focused, user-friendly apps with real-time updates and insights that bring value to sports enthusiasts and students alike.',
        url: 'https://github.com/MohammedRiswan4400/CFA-TVP',
        imageURL: 'assets/cfa tvp.jpg'),
    ProjectModel(
        title: 'Focus Store',
        dencription:
            'I developed a mobile e-commerce app, Focus Store, using Flutter, Firebase, and Bloc for efficient state management. The app offers a wide range of products, including mobile phones, smartwatches, and headphones, with seamless integration of Razorpay for secure and convenient payment processing. This project allowed me to build an engaging user experience with a focus on responsive UI and streamlined shopping interactions.',
        url: 'https://github.com/MohammedRiswan4400/Focus-store',
        imageURL: 'assets/focusstore.png'),
    ProjectModel(
        title: 'TMX Music',
        dencription:
            'I developed a mobile app called TMX Music using Flutter. It’s a dynamic, user-friendly music player designed to fetch songs directly from local storage, allowing users to enjoy their own music library. To ensure a responsive and consistent experience across screens, I used BLoC for state management, which streamlines state control and makes the app scalable for future features.\n\nThe app’s data is managed locally using the Hive database, enabling fast, offline access to music files. The design for TMX Music was crafted in Figma, ensuring a smooth, modern interface tailored to enhance the user experience. With intuitive navigation and efficient storage handling, TMX Music offers a clean, reliable music player experience.',
        url: 'https://github.com/MohammedRiswan4400/TMX-MUSIC',
        imageURL: 'assets/tmx.jpeg'),
    ProjectModel(
        title: 'Instagram Clone',
        dencription:
            'I developed an Instagram clone with a responsive and dynamic interface, closely replicating the core layout and features of Instagram. Built with HTML, CSS, and JavaScript, the project dynamically loads content, creating a fluid, interactive experience similar to the real platform.\n\nUsing HTML for structure, CSS and media queries for responsive design, and JavaScript to add interactive, dynamic content, the clone offers a realistic simulation of Instagram’s feed, profile sections, and post interactions. The responsive design ensures a seamless experience across all devices, adapting smoothly to mobile, tablet, and desktop views.',
        url: 'https://github.com/MohammedRiswan4400/insta-clone',
        imageURL: 'assets/instagram.jpg'),
    ProjectModel(
        title: 'Netflix Clone',
        dencription:
            'I developed a Netflix clone, recreating the look and feel of the platform\'s user interface using HTML and CSS. This static website project showcases essential design elements like layout, typography, and responsive styling, all modeled to resemble the popular streaming service. Although it doesn\'t include dynamic content or video playback, this clone effectively captures the visual design of Netflix and demonstrates my skills in web design and front-end development.',
        url: 'https://github.com/MohammedRiswan4400/netflix-clone',
        imageURL: 'assets/netflix.jpg'),
    ProjectModel(
        title: 'Youtube Clone',
        dencription:
            'I developed a YouTube clone as a static website using HTML, CSS, and media queries to replicate the design and layout of the YouTube interface. The project is fully responsive, ensuring an optimal viewing experience across various screen sizes. \n\nWith HTML as the structure, CSS for styling, and media queries to handle responsiveness, the site mimics YouTube’s homepage layout, including video thumbnails, a navigation bar, and a sidebar for suggested content. Though it’s a static site without dynamic content, the layout and design offer an authentic look and feel, demonstrating strong foundational skills in web design and responsiveness.',
        url: 'https://github.com/MohammedRiswan4400/YouTube-clone',
        imageURL: 'assets/youtybe.jpg'),
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
    List<Widget> images =
        List.generate((projects.length * 1.5).ceil(), (index) {
      if (index.isEven) {
        return ProjectImage(
            isSelected: selecTedIndex == index ~/ 2 ? true : false,
            project: projects[index ~/ 2],
            onPressed: () {
              updateIndex(index ~/ 2);
            });
      } else {
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
