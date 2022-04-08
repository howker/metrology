import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UIMessages {
  static Future<bool?> showSimpleToast(String message) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
