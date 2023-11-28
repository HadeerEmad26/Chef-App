import 'package:chef_app/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//one object of googleFonts instead of repute the .lato


//(_)private as used here only
TextStyle _textStyle({
  required Color color,
  required double fontSize,
  required FontWeight fontWeight,
}) {
  return GoogleFonts.lato(
      color: color, fontSize: fontSize, fontWeight: fontWeight);
}
//bold style
TextStyle boldStyle({
  Color color = AppColors.white,
  double fontSize=24,
}) =>
    _textStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    );

//regular style
TextStyle regularStyle({
  Color color = AppColors.white,
  double fontSize=24,
}) =>
    _textStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
    );

