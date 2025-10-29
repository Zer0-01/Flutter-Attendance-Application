import 'package:flutter/widgets.dart';
import 'package:toastification/toastification.dart';

void showErrorToast(BuildContext context,
    {required String title, String? message}) {
  toastification.show(
    context: context,
    type: ToastificationType.error,
    style: ToastificationStyle.fillColored,
    title: Text(title),
    description: message != null && message.isNotEmpty ? Text(message) : null,
    alignment: Alignment.bottomCenter,
    autoCloseDuration: const Duration(seconds: 2),
    borderRadius: BorderRadius.circular(100.0),
    closeButton: const ToastCloseButton(showType: CloseButtonShowType.none),
    closeOnClick: false,
    dragToClose: true,
    pauseOnHover: false,
  );
}
