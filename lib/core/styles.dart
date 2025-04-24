// Button Texts
// Button Form
// CircularProgressIndicator
// TextFilds
// Diferent Texts

import 'package:flutter/material.dart';

class Styles {
  static const TextStyle textStyle = TextStyle(
    color: Color(0xFFe3e3e3),
    fontFamily: "Consolas",
  );

  static ButtonStyle buttonStyle = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(Color(0xFF1a1a1a)),
    minimumSize: WidgetStateProperty.all(Size(200, 50)),
    padding: WidgetStateProperty.all(
      EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    ),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );
}
