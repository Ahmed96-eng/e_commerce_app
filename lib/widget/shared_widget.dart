import 'package:flutter/material.dart';
import 'package:flutter_flexible_toast/flutter_flexible_toast.dart';

class SharedWidget {
  static showToastMsg(message, {int time, fontSize = 16.0}) =>
      FlutterFlexibleToast.showToast(
        message: message,
        toastLength: Toast.LENGTH_SHORT,
        toastGravity: ToastGravity.BOTTOM,
        elevation: 10,
        textColor: Colors.black,
        backgroundColor: Colors.grey.withOpacity(0.5),
        timeInSeconds: time,
        fontSize: fontSize,
      );
}
