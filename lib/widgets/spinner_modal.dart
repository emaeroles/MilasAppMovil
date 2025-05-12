import 'package:flutter/material.dart';

void showLoadingDialog({required BuildContext context}) {
  FocusManager.instance.primaryFocus?.unfocus();
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFe3e3e3)),
          ),
        ),
      );
    },
  );
}
