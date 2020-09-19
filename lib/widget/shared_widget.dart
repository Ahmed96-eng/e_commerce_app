import 'package:flutter/material.dart';
import 'package:flutter_flexible_toast/flutter_flexible_toast.dart';

class SharedWidget {
  static showToastMsg(message, {int time, fontSize = 12.0}) =>
      FlutterFlexibleToast.showToast(
        message: message,
        toastLength: Toast.LENGTH_SHORT,
        toastGravity: ToastGravity.BOTTOM,
        elevation: 10,
        textColor: Colors.black,
        backgroundColor: Colors.redAccent.withOpacity(0.7),
        timeInSeconds: time,
      );
}
