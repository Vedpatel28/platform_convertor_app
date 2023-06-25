// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class DateTimeController extends ChangeNotifier {
  DateTime date = DateTime.now();

  picked({required BuildContext context}) async {
    DateTime? PickedDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1920),
      lastDate: DateTime(2023),
    );
    if (PickedDate != null && PickedDate != date) {
      date = PickedDate;
    }
    notifyListeners();
  }
}
