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
            // CircaAvtar
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
            SizedBox(height: s.height * 0.03),
            // Full Name
            SizedBox(
              width: 400,
              child: CupertinoTextFormFieldRow(
                placeholder: 'Full Name',
                prefix: const Icon(CupertinoIcons.person),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: CupertinoColors.inactiveGray, width: 1),
                ),
              ),
            ),
            // Phone Number
            SizedBox(
              width: 400,
              child: CupertinoTextFormFieldRow(
                placeholder: 'Phone Number',
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: CupertinoColors.inactiveGray, width: 1),
                ),
                prefix: const Icon(CupertinoIcons.phone),
              ),
            ),
            // Chat
            SizedBox(
              width: 400,
              child: CupertinoTextFormFieldRow(
                placeholder: 'Chat Conversation',
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: CupertinoColors.inactiveGray, width: 1),
                ),
                prefix: const Icon(CupertinoIcons.chat_bubble_text),
              ),
            ),
            SizedBox(height: s.height * 0.01),
            Row(
              children: [
                SizedBox(width: s.width * 0.045),
                const Icon(
                  CupertinoIcons.calendar,
                  color: CupertinoColors.activeBlue,
                ),
                SizedBox(width: s.width * 0.04),
                const Text("Pick Date"),
              ],
            ),
            SizedBox(height: s.height * 0.02),
            Row(
              children: [
                SizedBox(width: s.width * 0.045),
                const Icon(
                  CupertinoIcons.time,
                  color: CupertinoColors.activeBlue,
                ),
                SizedBox(width: s.width * 0.04),
                const Text("Pick Time"),
              ],
            ),
            SizedBox(height: s.height * 0.02),
            CupertinoButton(
              color: CupertinoColors.link,
              onPressed: () {},
              child: const Text("SAVE"),
            ),
          ],
        ),
      ),
    );
  }
}
