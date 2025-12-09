import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_portfolio_web/model/model_project.dart';
import 'package:flutter_portfolio_web/view/home/screen_about.dart';
import 'package:flutter_portfolio_web/view/home/screen_projects.dart';
import 'package:flutter_portfolio_web/view/widgets/custome_icon_button.dart';
import 'package:flutter_portfolio_web/view/widgets/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectDetails extends StatefulWidget {
  const ProjectDetails({
    super.key,
    required this.project,
  });
  final ProjectModel project;

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  // final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UbuntuGoogleFonts(
          text: widget.project.title,
          size: 30.h,
          weight: FontWeight.w600,
          color: Colors.white,
        ),
        10.verticalSpace,
        UbuntuGoogleFonts(
          textAlign: TextAlign.start,
          text: widget.project.subTitle,
          size: 20.h,
          weight: FontWeight.w600,
          color: Colors.white,
        ),
        10.verticalSpace,
        UbuntuGoogleFonts(
          text: 'Key Features:',
          size: 20.h,
          weight: FontWeight.w600,
          color: Colors.white,
        ),
        5.verticalSpace,
        ...widget.project.points.map((e) => buildPoint(e, context)),

        SizedBox(
          height: context.kHeight * 0.01,
        ),
        ...widget.project.tech.map((e) => GlassSkillChip(label: e)),
        // UbuntuGoogleFonts(
        //   text: widget.project.,
        //   size: getFondSize(false, context),
        //   weight: FontWeight.w300,
        //   color: Colors.white,
        //   textAlign: TextAlign.start,
        // ),
        SizedBox(
          height: context.kHeight * 0.02,
        ),

        widget.project.playStore.isNotEmpty
            ? Row(
                children: [
                  UbuntuGoogleFonts(
                    text: 'Get it on ',
                    size: getFondSize(false, context),
                    weight: FontWeight.w300,
                    color: Colors.white,
                    textAlign: TextAlign.start,
                  ),
                  GestureDetector(
                    onTap: () {
                      openURL(widget.project.gitHub);
                    },
                    child: UbuntuGoogleFonts(
                      text: 'Google Play',
                      size: getFondSize(false, context),
                      weight: FontWeight.w300,
                      color: Colors.blue,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              )
            : 0.verticalSpace,
        5.verticalSpace,
        widget.project.gitHub.isNotEmpty
            ? Row(
                children: [
                  UbuntuGoogleFonts(
                    text: 'You can check out the project on ',
                    size: getFondSize(false, context),
                    weight: FontWeight.w300,
                    color: Colors.white,
                    textAlign: TextAlign.start,
                  ),
                  GestureDetector(
                    onTap: () {
                      openURL(widget.project.gitHub);
                    },
                    child: UbuntuGoogleFonts(
                      text: 'GitHub.',
                      size: getFondSize(false, context),
                      weight: FontWeight.w300,
                      color: Colors.blue,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              )
            : 0.verticalSpace,
      ],
    );
  }

  Widget buildPoint(
    String text,
    BuildContext context,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(String.fromCharCode(0x2022),
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
                color: Colors.white)),
        SizedBox(
          width: context.kWidth * 0.005,
        ),
        Expanded(
            child: UbuntuGoogleFonts(
          text: text,
          size: 16.sp,
          weight: FontWeight.w500,
          color: Colors.white,
          textAlign: TextAlign.left,
        )),
      ],
    );
  }
}

// 💎 The Refactored Liquid Glass Skill Tile
class GlassSkillChip extends StatefulWidget {
  final String label;

  const GlassSkillChip({
    super.key,
    required this.label,
  });

  @override
  State<GlassSkillChip> createState() => _GlassSkillChipState();
}

class _GlassSkillChipState extends State<GlassSkillChip> {
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
              width: isHovered ? 220 : 200, // Expands on Hover
              height: isHovered ? 50 : 35, // Fixed Height
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
                    child: AnimatedOpacity(
                      opacity: 1.0,
                      duration: _animationDuration,
                      curve: _animationCurve,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
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
