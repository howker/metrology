import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataRangeProvider extends ChangeNotifier {
  String get finishDateValue => _finishDate;
  String get startDateValue => _startDate;

  String _finishDate = DateFormat('yyyy').format(DateTime.now());
  String _startDate = '2018';

  void setStartDate(String start) {
    _startDate = start;
    notifyListeners();
  }

  void setFinishDate(String finish) {
    _finishDate = finish;
    notifyListeners();
  }
}
