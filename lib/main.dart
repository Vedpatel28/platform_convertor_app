import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertor_app/controllers/convertor_controller.dart';
import 'package:platform_convertor_app/controllers/setting_controller.dart';
import 'package:platform_convertor_app/utils/routes_utils.dart';
import 'package:platform_convertor_app/views/Screens/cu_home_page.dart';
import 'package:platform_convertor_app/views/Screens/ma_add_contect_page.dart';
import 'package:platform_convertor_app/views/Screens/ma_calls_page.dart';
import 'package:platform_convertor_app/views/Screens/ma_chats_page.dart';
import 'package:platform_convertor_app/views/Screens/ma_home_page.dart';
import 'package:platform_convertor_app/views/Screens/ma_setting_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences pref = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => convertplatform(),
        ),
        ChangeNotifierProvider(
          create: (context) => settingpagecontroller(pref: pref),
        )
      ],
      // child: DevicePreview(
      //   builder: (context) =>
      child: const MyApp(),
    ),
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider.of<convertplatform>(context).isAndroid
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              brightness: Provider.of<settingpagecontroller>(context).getTheme
                  ? Brightness.dark
                  : Brightness.light,
            ),
            routes: {
              allroutes.MaHomePage: (context) => ma_home_page(),
              allroutes.MaAddContactPage: (context) => ma_add_contact_page(),
              allroutes.MaCallsPage: (context) => const ma_call_page(),
              allroutes.MaChatsPage: (context) =>  ma_chat_page(),
              allroutes.MaSettingPage: (context) => const ma_setting_page(),
            },
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            routes: {
              allroutes.CuHomePage: (context) => const cu_home_page(),
            },
          );
  }
}
