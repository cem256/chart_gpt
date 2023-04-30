import 'package:chart_gpt/app/theme/base/base_theme.dart';
import 'package:flutter/material.dart';

class LightTheme extends BaseTheme {
  @override
  Brightness get brightness => Brightness.light;

  @override
  ColorScheme get colorScheme => _colorScheme;

  ColorScheme get _colorScheme {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4355b9),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffdee0ff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff3c64ae),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffd8e2ff),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff537577),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa9d4d6),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff000000),
      background: Color(0xffffffff),
      onBackground: Color(0xff000000),
      surface: Color(0xffffffff),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xffeeeeee),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff737373),
      outlineVariant: Color(0xffbfbfbf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff121212),
      onInverseSurface: Color(0xffffffff),
      inversePrimary: Color(0xffdce3ff),
      surfaceTint: Color(0xff4355b9),
    );
  }
}
