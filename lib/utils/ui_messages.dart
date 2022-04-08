import 'package:fluttertoast/fluttertoast.dart';

class UIMessages {
  static Future<bool?> showSimpleToast(String message) {
    return Fluttertoast.showToast(
      msg: message,
    );
  }
}
