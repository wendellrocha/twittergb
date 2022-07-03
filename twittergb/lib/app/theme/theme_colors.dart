import 'package:flutter/material.dart';

class ThemeColors {
  MaterialColor primarySwatch = const MaterialColor(
    0xFFFD9B04,
    <int, Color>{
      50: Color(0xFFFFF3E1),
      100: Color(0xFFFEE1B4),
      200: Color(0xFFFECD82),
      300: Color(0xFFFEB94F),
      400: Color(0xFFFDAA2A),
      500: Color(0xFFFD9B04),
      600: Color(0xFFFD9303),
      700: Color(0xFFFC8903),
      800: Color(0xFFFC7F02),
      900: Color(0xFFFC6D01),
    },
  );

  Color primary = const Color(0xFFFD9B04);
  Color secondary = const Color(0xFF4780BC);

  /// Light
  Color dividerColor = const Color(0xFFBDBDBD);
  Color textColor = const Color(0xFF1A1A1A);
  Color textSecondaryColor = const Color(0xFF534F4F);
  Color backgroundColor = Colors.white;

  /// Dark
  Color dividerColorDark = const Color(0xFFBDBDBD);
  Color textColorDark = const Color(0xFFE0E0E0);
  Color textSecondaryColorDark = const Color(0xFF9C9898);
  Color backgroundColorDark = const Color(0xFF263238);

  double defaultTextFontSize = 10;
  double defaultBottomBarFontSize = 9;
  double defaultTitleFontSize = 14;
  double defaultNewsTitleFontSize = 18;
}
