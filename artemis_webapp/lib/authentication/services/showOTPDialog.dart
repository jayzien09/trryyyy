import 'package:flutter/material.dart';

void showOTPDialog({
  required BuildContext context,
  required TextEditingController codeController,
  required VoidCallback onPressed,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: const Text('Enter OTP'),
        content: TextField(
          controller: codeController,
        ),
        actions: [
          TextButton(
            onPressed: onPressed,
            child: const Text('Confirm'),
          ),
          TextButton(
            onPressed: (() => Navigator.pop(context)),
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}
