import 'package:flutter/material.dart';
import 'package:flutter_portfolio_web/model/model_project.dart';
import 'package:flutter_portfolio_web/view/home/screen_about.dart';
import 'package:flutter_portfolio_web/view/home/screen_projects.dart';
import 'package:flutter_portfolio_web/view/widgets/custome_icon_button.dart';
import 'package:flutter_portfolio_web/view/widgets/google_fonts.dart';

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
          size: getFondSize(true, context),
          weight: FontWeight.w500,
          color: Colors.white,
        ),
        SizedBox(
          height: context.kHeight * 0.01,
        ),
        UbuntuGoogleFonts(
          text: widget.project.dencription,
          size: getFondSize(false, context),
          weight: FontWeight.w300,
          color: Colors.white,
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: context.kHeight * 0.02,
        ),
        Row(
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
                openURL(widget.project.url);
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
        ),
      ],
    );
  }
}
