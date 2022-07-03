import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'theme_colors.dart';

class LightTheme extends ThemeColors {
  late final ThemeData themeData;

  LightTheme() {
    themeData = ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primarySwatch: primarySwatch,
      primaryColor: primary,
      scaffoldBackgroundColor: backgroundColor,
      shadowColor: Colors.black,
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: primary,
            secondary: secondary,
          ),
      dividerColor: dividerColor,
      hoverColor: primary.withOpacity(0.4),
      splashColor: primary,
      backgroundColor: backgroundColor,
      iconTheme: IconThemeData(
        color: textColor,
      ),
      fontFamily: GoogleFonts.ubuntu().fontFamily,
      textTheme: TextTheme(
        subtitle1: TextStyle(
          fontSize: defaultTitleFontSize,
          color: textColor,
        ),
        bodyText1: TextStyle(
          fontFamily: GoogleFonts.ubuntu().fontFamily,
          color: textColor,
          fontSize: defaultTitleFontSize,
        ),
        headline6: TextStyle(
          fontFamily: GoogleFonts.ubuntu().fontFamily,
          color: textColor,
        ),
        bodyText2: TextStyle(
          fontFamily: GoogleFonts.ubuntu().fontFamily,
          color: textSecondaryColor,
          fontSize: defaultTextFontSize,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: TextStyle(
            fontFamily: GoogleFonts.ubuntu().fontFamily,
            color: Colors.white,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: primary,
          textStyle: TextStyle(
            fontFamily: GoogleFonts.ubuntu().fontFamily,
            color: Colors.white,
          ),
          minimumSize: const Size(120, 45),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: primary,
        toolbarTextStyle: TextStyle(
          fontFamily: GoogleFonts.ubuntu().fontFamily,
          color: Colors.white,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFE5E5E5).withOpacity(0.75),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
