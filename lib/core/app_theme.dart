import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xFF1a1a1a),
      scaffoldBackgroundColor: const Color(0xFF242424),

      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF1a1a1a),
        onPrimary: Color(0xFFe3e3e3),
        secondary: Color(0xFF3b3b3b),
        onSecondary: Color(0xFFe3e3e3),
        error: Color(0xFFE57373),
        onError: Color(0xFF242424),
        surface: Color(0xFF3b3b3b),
        onSurface: Color(0xFFe3e3e3),
        brightness: Brightness.dark,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1a1a1a),
        foregroundColor: Color(0xFFe3e3e3),
        elevation: 0,
        centerTitle: true,
      ),

      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontFamily: "Consolas",
          fontWeight: FontWeight.bold,
          color: Color(0xFFe3e3e3),
        ),
        bodyMedium: TextStyle(
          fontFamily: "Consolas",
          fontSize: 16,
          color: Color(0xFFe3e3e3),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xFF1a1a1a),
          foregroundColor: const Color(0xFFe3e3e3),
          textStyle: const TextStyle(fontFamily: "Consolas", fontSize: 16),
          side: const BorderSide(
            color: Color(0xFFbababa), // grosor del borde
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFFe3e3e3),
          textStyle: const TextStyle(fontFamily: "Consolas"),
        ),
      ),

      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Color(0xFF3b3b3b),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        labelStyle: TextStyle(fontFamily: "Consolas", fontSize: 16),
        floatingLabelStyle: TextStyle(
          fontFamily: "Consolas",
          color: Color(0xFFe3e3e3),
          fontSize: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFbababa)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFFFFFF)),
        ),
        errorStyle: TextStyle(fontFamily: "Consolas", color: Color(0xFFE57373)),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE57373)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFF44336)),
        ),
        errorMaxLines: 3,
      ),

      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Color(0xFFe3e3e3),
        selectionColor: Color(0xFF242424),
        selectionHandleColor: Color(0xFFbababa),
      ),

      dialogTheme: DialogTheme(
        backgroundColor: Color(0xFF3b3b3b),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Color(0xFFbababa), width: 2),
        ),
        titleTextStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: "Consolas",
          color: Color(0xFFe3e3e3),
        ),
        contentTextStyle: const TextStyle(
          fontFamily: "Consolas",
          color: Color(0xFFe3e3e3),
        ), // opcional
      ),

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Color(0xFFe3e3e3),
      ),
    );
  }
}
