import 'package:flutter/material.dart';

class Styles {
  static ButtonStyle min100ButtonStyle = ButtonStyle(
    minimumSize: WidgetStateProperty.all(Size(100, 50)),
  );

  static ButtonStyle min200ButtonStyle = ButtonStyle(
    minimumSize: WidgetStateProperty.all(Size(200, 50)),
  );

  static ButtonStyle min300ButtonStyle = ButtonStyle(
    minimumSize: WidgetStateProperty.all(Size(300, 50)),
  );
}
