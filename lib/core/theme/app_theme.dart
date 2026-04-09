import 'package:flutter/material.dart';
import 'modes/dark.dart';
import 'modes/light.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get dark => DarkTheme.theme;
  static ThemeData get light => LightTheme.theme;
}
