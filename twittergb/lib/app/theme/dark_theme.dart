import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'theme_colors.dart';

class DarkTheme extends ThemeColors {
  late final ThemeData themeData;

  DarkTheme() {
    themeData = ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primarySwatch: primarySwatch,
      primaryColor: primary,
      scaffoldBackgroundColor: backgroundColorDark,
      shadowColor: Colors.grey[200],
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: primary,
            secondary: secondary,
          ),
      dividerColor: dividerColorDark,
      backgroundColor: backgroundColorDark,
      hoverColor: primary.withOpacity(0.2),
      splashColor: primary,
      fontFamily: GoogleFonts.ubuntu().fontFamily,
      iconTheme: IconThemeData(
        color: textColorDark,
      ),
      textTheme: TextTheme(
        subtitle1: TextStyle(
          fontFamily: GoogleFonts.ubuntu().fontFamily,
          fontSize: defaultTitleFontSize,
          color: textColorDark,
        ),
        subtitle2: TextStyle(
          fontFamily: GoogleFonts.ubuntu().fontFamily,
          fontSize: defaultTitleFontSize,
          color: textSecondaryColorDark,
        ),
        bodyText1: TextStyle(
          fontFamily: GoogleFonts.ubuntu().fontFamily,
          color: textColorDark,
          fontSize: defaultTitleFontSize,
        ),
        headline6: TextStyle(
          fontFamily: GoogleFonts.ubuntu().fontFamily,
          color: textColorDark,
        ),
        bodyText2: TextStyle(
          fontFamily: GoogleFonts.ubuntu().fontFamily,
          color: textSecondaryColorDark,
          fontSize: defaultTextFontSize,
        ),
        caption: TextStyle(
          fontFamily: GoogleFonts.ubuntu().fontFamily,
          color: textSecondaryColorDark,
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
