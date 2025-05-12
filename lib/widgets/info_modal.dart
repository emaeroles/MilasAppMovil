import 'package:flutter/material.dart';
import 'package:milas_app_movil/core/styles.dart';

Future<void> showInfoDialog({
  required BuildContext context,
  required String title,
  required String message,
  String buttonText = 'OK',
}) {
  return showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Color(0xFF242424),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Color(0xFF858585), width: 2),
        ),
        title: Text(
          title,
          style: Styles.textStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(message, style: Styles.textStyle.copyWith(fontSize: 18)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              buttonText,
              style: Styles.textStyle.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    },
  );
}
