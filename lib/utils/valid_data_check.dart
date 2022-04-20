import 'package:intl/intl.dart';

class ValidDataCheck {
  static bool validStatus(String dataToCheck) {
    if (dataToCheck == '') {
      return false;
    }

    try {
      final endDate = DateFormat('dd.MM.yyyy').parse(dataToCheck);

      if (DateTime.now().compareTo(endDate) < 0) {
        return true;
      }
    } on Exception {
      return false;
    }
    return false;
  }
}
