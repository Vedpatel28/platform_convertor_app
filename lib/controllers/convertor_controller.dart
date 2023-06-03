import 'package:flutter/cupertino.dart';

class convertplatform extends ChangeNotifier {
  bool isAndroid = true;

  void mechangeplatform({required bool cuplatform}) {
    isAndroid = !isAndroid;
    notifyListeners();
  }
}
