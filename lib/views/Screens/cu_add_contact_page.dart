// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:platform_convertor_app/controllers/convertor_controller.dart';
import 'package:provider/provider.dart';

class cu_add_contact_page extends StatelessWidget {
  const cu_add_contact_page({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Add Contact"),
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: s.height * 0.15),
            // CircalAvtar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                      color: CupertinoColors.systemBlue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(200),
                      ),
                    ),
                    child: Icon(
                      size: s.height * 0.04,
                      CupertinoIcons.camera,
                      color: CupertinoColors.tertiarySystemBackground,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: s.height * 0.02),
            Container(
              width: 330,
              child: const CupertinoTextField(
                prefix: Icon(CupertinoIcons.person),
              ),
            ),
            SizedBox(height: s.height * 0.02),
            Container(
              width: 330,
              child: CupertinoTextField(
                prefix: Icon(CupertinoIcons.phone),
              ),
            ),
            SizedBox(height: s.height * 0.02),
            Container(
              width: 330,
              child: CupertinoTextField(
                prefix: Icon(CupertinoIcons.chat_bubble_text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
