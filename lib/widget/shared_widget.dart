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

  static showAlertDailog(BuildContext context, String message,
          Function onPressNo, Function onPressYes) =>
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          // backgroundColor: Colors.redAccent.withOpacity(0.4),
          backgroundColor: Colors.red[300],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: new Text(
            "Are You Sure?",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
          ),
          content: new Text(
            message,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              shape: StadiumBorder(),
              color: Colors.white,
              child: new Text(
                "Yes",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: onPressYes,
            ),
            FlatButton(
              shape: StadiumBorder(),
              color: Colors.white,
              child: new Text(
                "No",
                style: TextStyle(color: Colors.black54),
              ),
              onPressed: onPressNo,
            ),
          ],
        ),
      );
}
