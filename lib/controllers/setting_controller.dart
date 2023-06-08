import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class settingpagecontroller extends ChangeNotifier {

  bool profileSwitch = false;
  final String _varprofile = "is_min";

  bool darktheme = false;
  final String _varTheme = "is_dark";

  SharedPreferences pref;

  settingpagecontroller({required this.pref});

  bool get getTheme {
    if (pref.getBool(_varTheme) ?? false) {
      darktheme = pref.getBool(_varTheme)!;
    } else {
      pref.setBool(_varTheme, darktheme);
    }
    return darktheme;
  }

  // bool get getprofile {
  //   if (pref.getBool(_varprofile) ?? false) {
  //     profileSwitch = pref.getBool(_varprofile)!;
  //   } else {
  //     pref.setBool(_varprofile, profileSwitch);
  //   }
  //   return profileSwitch;
  // }

  Expandprofile(){
    profileSwitch = !profileSwitch;
    pref.setBool(_varprofile, profileSwitch);
    notifyListeners();
  }


  changetheme() {
    darktheme = !darktheme;
    pref.setBool(_varTheme, darktheme);
    notifyListeners();
  }
}
