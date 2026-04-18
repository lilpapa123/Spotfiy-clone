import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._(); // Prevent instantiation

  static const _inputBorderRadius = 30.0;
  static const _inputContentPadding = EdgeInsets.all(20);
  static const _buttonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const _buttonBorderRadius = 30.0;

  static InputDecorationTheme _inputDecorationTheme({
    required Color borderColor,
  }) => InputDecorationTheme(
    filled: true,
    fillColor: Colors.transparent,
    contentPadding: _inputContentPadding,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_inputBorderRadius),
      borderSide: BorderSide(color: borderColor, width: 0.4),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_inputBorderRadius),
      borderSide: BorderSide(color: borderColor, width: 0.4),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_inputBorderRadius),
      borderSide: BorderSide(color: borderColor, width: 1.2),
    ),
  );

  static final _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      elevation: 0,
      foregroundColor: Colors.white,
      textStyle: _buttonTextStyle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_buttonBorderRadius),
      ),
    ),
  );

  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    brightness: Brightness.light,
    fontFamily: 'Satoshi',
    inputDecorationTheme: _inputDecorationTheme(borderColor: Colors.black),
    elevatedButtonTheme: _elevatedButtonTheme,
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    brightness: Brightness.dark,
    fontFamily: 'Satoshi',
    inputDecorationTheme: _inputDecorationTheme(borderColor: Colors.white),
    elevatedButtonTheme: _elevatedButtonTheme,
  );
}
