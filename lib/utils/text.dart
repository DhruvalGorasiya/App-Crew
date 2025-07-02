import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

///
/// Default FONT Family
///
final defaultFontFamily = GoogleFonts.archivo().fontFamily;

///
///   Other Fonts
///
final poppinsFontFamily = GoogleFonts.poppins().fontFamily;
final interFontFamily = GoogleFonts.inter().fontFamily;
final lobsterFamily = GoogleFonts.lobster().fontFamily;

Text customText({
  required String text,
  int? maxLines,
  TextAlign? textAlign,
  TextStyle? style,
}) {
  return Text(
    text,
    overflow: maxLines != null ? TextOverflow.ellipsis : null,
    textAlign: textAlign,
    maxLines: maxLines,
    // textScaleFactor: 1,
    textScaler: const TextScaler.linear(1),
    style: style,
  );
}

///
///   TextFiled Text Style
///

TextStyle get textFiledTextStyle => TextStyle(
      color: gray900Color,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: defaultFontFamily,
    );

TextStyle get disableTextFiledTextStyle => TextStyle(
      color: systemColor3,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: defaultFontFamily,
    );

TextStyle get hintTextFiledTextStyle => TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: gray400Color,
      fontFamily: defaultFontFamily,
    );

TextStyle get labelTextFiledTextStyle => TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: gray400Color,
      fontFamily: defaultFontFamily,
    );

TextStyle get errorTextFiledTextStyle => TextStyle(
      color: errorColor,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      fontFamily: defaultFontFamily,
    );

///
///   Poppins Text Style
///

TextStyle get style18900WhitePoppins => TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w900,
      color: white,
      fontFamily: poppinsFontFamily,
    );

TextStyle get style18900BlackPoppins => TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w900,
      color: black,
      fontFamily: poppinsFontFamily,
    );

TextStyle get style18500WhitePoppins => TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: white,
      fontFamily: poppinsFontFamily,
    );

TextStyle get style16500WhitePoppins => TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: white,
      fontFamily: poppinsFontFamily,
    );

TextStyle get style16500BlackPoppins => TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: black,
      fontFamily: poppinsFontFamily,
    );

TextStyle get style12400Grey66Poppins => TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: grey66,
      fontFamily: poppinsFontFamily,
    );

///
/// Style From Figma
///

// Title
TextStyle get styleTitle42Bold => TextStyle(
      fontSize: 42,
      fontWeight: FontWeight.w700,
      fontFamily: defaultFontFamily,
      // height: 54.68 / 42, // Line height as a factor of font size
    );

TextStyle get styleTitle42SemiBold => TextStyle(
      fontSize: 42,
      fontWeight: FontWeight.w600,
      fontFamily: defaultFontFamily,
      // height: 54.68 / 42,
    );

TextStyle get styleTitle32Bold => TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      fontFamily: defaultFontFamily,
      // height: 41.66 / 32,
    );

TextStyle get styleTitle32SemiBold => TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      fontFamily: defaultFontFamily,
      // height: 41.66 / 32,
    );

TextStyle get styleTitle24Bold => TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      fontFamily: defaultFontFamily,
      // height: 31.25 / 24,
    );

TextStyle get styleTitle24SemiBold => TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      fontFamily: defaultFontFamily,
      // height: 31.25 / 24,
    );

TextStyle get styleTitle24Medium => TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      fontFamily: defaultFontFamily,
      // height: 31.25 / 24,
    );

//Subtitle
TextStyle get styleSubtitle20Bold => TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: defaultFontFamily,
      // height: 26.04 / 20,
      // letterSpacing: 0.01,
    );

TextStyle get styleSubtitle20SemiBold => TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: defaultFontFamily,
      // height: 26.04 / 20,
    );

TextStyle get styleSubtitle20Medium => TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      fontFamily: defaultFontFamily,
      // height: 26.04 / 20,
    );

TextStyle get styleSubtitle18Bold => TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      fontFamily: defaultFontFamily,
      // height: 23.44 / 18,
      // letterSpacing: 0.01,
    );

TextStyle get styleSubtitle18SemiBold => TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: defaultFontFamily,
      // height: 23.44 / 18,
    );

TextStyle get styleSubtitle18Medium => TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontFamily: defaultFontFamily,
      // height: 23.44 / 18,
    );

TextStyle get styleSubtitle18Regular => TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      fontFamily: defaultFontFamily,
      // height: 23.44 / 18,
    );

TextStyle get styleSubtitle16SemiBold => TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: defaultFontFamily,
      // height: 20.83 / 16,
    );

//Body
TextStyle get styleBody16SemiBold => TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: defaultFontFamily,
    );

TextStyle get styleBody16Medium => TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: defaultFontFamily,
      // height: 20.83 / 16,
    );

TextStyle get styleBody16Regular => TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: defaultFontFamily,
    );

TextStyle get styleBody14Bold => TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: defaultFontFamily,
      // height: 18.23 / 14,
    );

TextStyle get styleBody14Medium => TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: defaultFontFamily,
      // height: 18.23 / 14,
    );

TextStyle get styleBody14Regular => TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: defaultFontFamily,
      // height: 18.23 / 14,
    );

// Captions
TextStyle get styleCaption12Medium => TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: defaultFontFamily,
      // height: 15.62 / 12,
    );

TextStyle get styleCaption12Regular => TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: defaultFontFamily,
      // height: 15.62 / 12,
    );

//Actions
TextStyle get styleButton14 => TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: defaultFontFamily,
      // height: 18.23 / 14,
    );

TextStyle get styleLink14 => TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: defaultFontFamily,
      // height: 18.23 / 14,
    );
TextStyle get styleButton12 => TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: defaultFontFamily,
      // height: 18.23 / 14,
    );

///
/// Default Style  Start
///

TextStyle get style10500 => TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      fontFamily: defaultFontFamily,
      // height: 15.62 / 12,
    );

TextStyle get style10400 => TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      fontFamily: defaultFontFamily,
      // height: 15.62 / 12,
    );

TextStyle get style36800 => TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w800,
      fontFamily: defaultFontFamily,
      // height: 15.62 / 12,
    );

TextStyle get style20800 => TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w800,
      fontFamily: defaultFontFamily,
      // height: 15.62 / 12,
    );

///
/// interFontFamily
///

TextStyle get style12400Inter => TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: interFontFamily,
    );

TextStyle get style12500Inter => TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: interFontFamily,
    );

TextStyle get style10400Inter => TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      fontFamily: interFontFamily,
    );
TextStyle get style10500Inter => TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      fontFamily: interFontFamily,
    );

TextStyle get style32500Inter => TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      fontFamily: interFontFamily,
    );

///
///   lobsterFamily
///

TextStyle get style24400Lobster => TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      fontFamily: lobsterFamily,
    );
