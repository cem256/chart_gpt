import 'package:chart_gpt/app/theme/theme_constants.dart';
import 'package:flutter/material.dart';

abstract class BaseTheme {
  Brightness get brightness;
  ColorScheme get colorScheme;

  ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      cardTheme: _cardTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      inputDecorationTheme: _inputDecorationTheme,
      typography: Typography.material2021(),
    );
  }

  CardTheme get _cardTheme {
    return CardTheme(
      elevation: 4,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: ThemeConstants.borderRadiusCircular,
      ),
    );
  }

  ElevatedButtonThemeData get _elevatedButtonTheme => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(56),
          shape: RoundedRectangleBorder(
            borderRadius: ThemeConstants.borderRadiusCircular,
          ),
        ),
      );

  InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: ThemeConstants.borderRadiusCircular,
      ),
    );
  }
}
