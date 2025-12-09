import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_portfolio_web/view/home/screen_about.dart';
import 'package:flutter_portfolio_web/model/model_project.dart';
import 'package:flutter_portfolio_web/view/home/screen_projects.dart';
import 'package:flutter_portfolio_web/view/widgets/custome_icon_button.dart';
import 'package:flutter_portfolio_web/view/widgets/google_fonts.dart';
import 'package:hovering/hovering.dart';

class ProjectImage extends StatelessWidget {
  const ProjectImage(
      {super.key,
      required this.project,
      required this.onPressed,
      required this.isSelected});

  final ProjectModel project;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    double space = context.kHeight * 0.02;

    double imageSize = context.kHeight * 0.2;
    return Theme(
      data: ThemeData(
          splashColor: Colors.transparent, highlightColor: Colors.transparent),
      child: Container(
        // color: Colors.amber,s
        width: context.kWidth * 0.25,
        child: HoverCrossFadeWidget(
            firstChild: Row(
              children: [
                Container(
                  height: imageSize,
                  width: imageSize,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      project.imageURL,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: space,
                ),
                isSelected
                    ? Container(
                        height: 3,
                        width: context.kWidth * 0.03,
                        color: Colors.white,
                      )
                    : const SizedBox()
              ],
            ),
            secondChild: InkWell(
              onTap: onPressed,
              child: Row(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          project.imageURL,
                          fit: BoxFit.cover,
                          height: imageSize,
                          width: imageSize,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Color.fromARGB(141, 255, 255, 255),
                            Color.fromARGB(51, 255, 255, 255),
                          ]),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: imageSize,
                        width: imageSize,
                        child: Center(
                          child: UbuntuGoogleFonts(
                              text: project.title,
                              size: 12,
                              weight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: space,
                  ),
                  Container(
                    height: 3,
                    width: context.kWidth * 0.02,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            duration: const Duration(milliseconds: 200)),
      ),
    );
  }
}

class ProjectImageOnMobile extends StatelessWidget {
  const ProjectImageOnMobile({
    super.key,
    required this.project,
  });
  final ProjectModel project;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  project.imageURL,
                  height: context.kWidth * 0.3,
                  width: context.kWidth * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
              UbuntuGoogleFonts(
                text: project.title,
                lineCount: 1,
                size: context.kWidth < 380
                    ? getFondSize(true, context) / 2
                    : getFondSize(true, context),
                weight: FontWeight.w700,
                color: Colors.black,
              ),
              GestureDetector(
                onTap: () => openURL(project.gitHub),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.insert_link_rounded,
                      color: Colors.blue,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    UbuntuGoogleFonts(
                      text: 'GitHub',
                      size: getFondSize(true, context) / 3,
                      weight: FontWeight.w700,
                      color: Colors.blue,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
