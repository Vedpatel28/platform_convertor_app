// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:platform_convertor_app/controllers/convertor_controller.dart';
import 'package:provider/provider.dart';

class cu_home_page extends StatelessWidget {
  const cu_home_page({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_add),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),
            label: "CHATS",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone),
            label: "CALLS",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: "SETTING",
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
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
              child: const Center(
              ),
            );
          },
        );
      },
    );
  }
}
