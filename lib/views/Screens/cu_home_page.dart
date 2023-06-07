// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:platform_convertor_app/controllers/convertor_controller.dart';
import 'package:provider/provider.dart';

class cu_home_page extends StatelessWidget {
  const cu_home_page({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("IOS"),
        trailing: Consumer<convertplatform>(
          builder: (context, provider, child) => Transform.scale(
            scale: 0.8,
            child: CupertinoSwitch(
              value: provider.isAndroid,
              onChanged: (value) {
                provider.mechangeplatform(cuplatform: value);
              },
            ),
          ),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            CupertinoButton.filled(
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    content: SizedBox(
                      height: 200,
                      child: CupertinoTimerPicker(
                        onTimerDurationChanged: (duration) {},
                      ),
                    ),
                  ),
                );
              },
              child: const Text("Date Select"),
            ),
          ],
        ),
      ),
    );
  }
}
