import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertor_app/controllers/convertor_controller.dart';
import 'package:platform_convertor_app/views/Screens/cupertino_home_page.dart';
import 'package:platform_convertor_app/views/Screens/material_home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => convertplatform(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
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
            ),
            routes: {
              '/': (context) => const ANhomepage(),
            },
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => const IOhomepage(),
            },
          );
  }
}
