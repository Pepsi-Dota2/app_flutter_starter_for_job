import 'package:flutter/material.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';

Future<void> showCustomOkCancelDialog({
  required BuildContext context,
  required String title,
  required String message,
  String okLabel = 'OK',
  String cancelLabel = 'Cancel',
  bool barrierDismissible = true,
  void Function(OkCancelResult result)? onResult,
  AdaptiveStyle? style,
}) async {
  final result = await showOkCancelAlertDialog(
    context: context,
    title: title,
    message: message,
    okLabel: okLabel,
    cancelLabel: cancelLabel,
    barrierDismissible: barrierDismissible,
    style: style,
  );
  if (onResult != null) {
    onResult(result);
  }
}
