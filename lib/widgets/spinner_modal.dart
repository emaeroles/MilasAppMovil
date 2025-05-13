import 'package:flutter/material.dart';

void showLoadingDialog({required BuildContext context}) {
  FocusManager.instance.primaryFocus?.unfocus();
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide.none,
        ),
        child: Center(child: CircularProgressIndicator()),
      );
    },
  );
}
