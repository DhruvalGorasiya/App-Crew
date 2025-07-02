import 'package:app_crew/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sliding_toast/flutter_sliding_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast({required String? msg, Color? color, Color? textColor}) {
  return Fluttertoast.showToast(
    msg: msg ?? "",
    gravity: ToastGravity.BOTTOM,
    backgroundColor: color,
    fontSize: 16.0,
    textColor: textColor,
  );
}

///
///   Simple Toast
///

void showInfoToastSimple(String message) {
  showToast(msg: message, color: yellow600Color, textColor: white);
}

void showSuccessToastSimple(String message) {
  showToast(msg: message, color: green500Color, textColor: white);
}

void showErrorToastSimple(String message) {
  showToast(msg: message, color: red500Color, textColor: white);
}

///
///   Animated Toast
///

void showInfoToast(BuildContext context, String message) {
  try {
    InteractiveToast.slide(
      context,
      title: Text(message),
      toastSetting: const SlidingToastSetting(
        toastStartPosition: ToastPosition.right,
        toastAlignment: Alignment.topRight,
        displayDuration: Duration(seconds: 2),
      ),
      trailing: Icon(
        Icons.info,
        color: primaryColor,
      ),
    );
  } catch (e) {
    showInfoToastSimple(message);
  }
}

void showSuccessToast(BuildContext context, String message) {
  try {
    InteractiveToast.slideSuccess(
      context,
      title: Text(message),
      toastSetting: const SlidingToastSetting(
        toastStartPosition: ToastPosition.right,
        toastAlignment: Alignment.topRight,
        displayDuration: Duration(seconds: 2),
      ),
    );
  } catch (e) {
    showSuccessToastSimple(message);
  }
}

void showErrorToast(BuildContext context, String message) {
  try {
    InteractiveToast.slideError(
      context,
      title: Text(message),
      toastSetting: const SlidingToastSetting(
        toastStartPosition: ToastPosition.left,
        toastAlignment: Alignment.bottomLeft,
        displayDuration: Duration(seconds: 2),
        padding: EdgeInsets.only(top: 10, right: 10, left: 20, bottom: 20),
      ),
    );
  } catch (e) {
    showErrorToastSimple(message);
  }
}
