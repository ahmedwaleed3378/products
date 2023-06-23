import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:products/controller/provider.dart';
import 'package:provider/provider.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color orangeClr = Color(0xCFFF8746);
const Color pinkClr = Color(0xFFff4667);
Color white = Colors.white;
const Color white2 = Colors.white54;
const Color prmClr = Color.fromARGB(255, 41, 155, 184);
Color bgGradient = white.withOpacity(0.8);
Color darkGreyClr = const Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);
const Color bgClr = Color.fromRGBO(241, 241, 241, 1);

TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 28, color: prmClr));
}

TextStyle get subheadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: darkGreyClr));
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color:
              // Get.isDarkMode ? Colors.
              darkGreyClr));
}

TextStyle get subtitleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          overflow: TextOverflow.clip,
          color:
              // Get.isDarkMode ? Colors.
              darkGreyClr));
}

TextStyle get bodyStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.fade,
          fontSize: 14,
          color:
              // Get.isDarkMode ? Colors.
              darkGreyClr));
}

SizedBox sized({double width = 0, double height = 0}) {
  return SizedBox(width: width, height: height);
}
