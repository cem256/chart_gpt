import 'package:chart_gpt/app/theme/base/base_theme.dart';
import 'package:flutter/material.dart';

class DarkTheme extends BaseTheme {
  @override
  Brightness get brightness => Brightness.dark;

  @override
  ColorScheme get colorScheme => _colorScheme;

  ColorScheme get _colorScheme {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffbac3ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff293ca0),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xffaec6ff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff14448d),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xffa9cdcf),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff2a4c4e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffffb4ab),
      onError: Color(0xff000000),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xff121212),
      onBackground: Color(0xffffffff),
      surface: Color(0xff121212),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff323232),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xff8c8c8c),
      outlineVariant: Color(0xff404040),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffffffff),
      onInverseSurface: Color(0xff000000),
      inversePrimary: Color(0xff5a5e70),
      surfaceTint: Color(0xffbac3ff),
    );
  }
}
