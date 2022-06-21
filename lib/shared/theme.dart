import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultRadius = 18.0;
double defaultMargin = 24.0;

Color kPrimaryColor = Color(0xff009288);
Color kWhiteColor = Color(0xffFFFFFF);
Color kGreyColor = Color(0xff9698A9);
Color kBackgroundColor = Color(0xffFAFAFA);
Color kInactiveColor = Color(0xff1F644C);
Color kBlackColor = Color(0xff103D2D);
Color kTransparentColor = Colors.transparent;

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: kBlackColor,
);
TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: kWhiteColor,
);
TextStyle greyTextStyle = GoogleFonts.poppins(
  color: kGreyColor,
);
TextStyle transparentTextStyle = GoogleFonts.poppins(
  color: kTransparentColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;
