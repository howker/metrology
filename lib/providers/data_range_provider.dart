import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataRangeProvider extends ChangeNotifier {
  String finishDate = DateFormat('yyyy').format(DateTime.now());
  String startDate = '2018';

  void setStartDate(String start) {
    startDate = start;
    notifyListeners();
  }

  void setFinishDate(String finish) {
    finishDate = finish;
    notifyListeners();
  }
}
