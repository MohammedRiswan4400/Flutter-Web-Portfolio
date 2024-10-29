import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomeGoogleFont extends StatelessWidget {
  CustomeGoogleFont(
      {super.key,
      required this.text,
      required this.size,
      required this.weight,
      this.color,
      this.textAlign,
      this.lineCount});
  final String text;
  final double size;
  final FontWeight weight;
  Color? color;
  TextAlign? textAlign;
  int? lineCount;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: lineCount,
      textAlign: textAlign ?? TextAlign.center,
      style: GoogleFonts.firaCode(
        textStyle: TextStyle(
          fontSize: size,
          fontWeight: weight,
          color: color,
        ),
      ),
    );
  }
}

class UbuntuGoogleFonts extends StatelessWidget {
  UbuntuGoogleFonts(
      {super.key,
      required this.text,
      required this.size,
      required this.weight,
      this.color,
      this.textAlign,
      this.lineCount});
  final String text;
  final double size;
  final FontWeight weight;
  Color? color;
  TextAlign? textAlign;
  int? lineCount;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: lineCount,
      textAlign: textAlign ?? TextAlign.center,
      style: GoogleFonts.ubuntu(
        textStyle: TextStyle(
          fontSize: size,
          fontWeight: weight,
          color: color,
        ),
      ),
    );
  }
}
