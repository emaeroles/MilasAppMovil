import 'package:flutter/material.dart';

Future<void> showInfoDialog({
  required BuildContext context,
  required String message,
  bool red = false,
  String buttonText = 'OK',
}) {
  return showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        elevation: 0,
        contentPadding: EdgeInsets.all(30),
        title: Text(
          message,
          style:
              red
                  ? TextStyle(color: Theme.of(context).colorScheme.error)
                  : null,
        ),
        //content:
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    },
  );
}
