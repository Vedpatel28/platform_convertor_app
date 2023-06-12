// ignore_for_file: camel_case_types

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertor_app/controllers/convertor_controller.dart';
import 'package:platform_convertor_app/views/Screens/ma_add_contect_page.dart';
import 'package:platform_convertor_app/views/Screens/ma_calls_page.dart';
import 'package:platform_convertor_app/views/Screens/ma_chats_page.dart';
import 'package:platform_convertor_app/views/Screens/ma_setting_page.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ma_home_page extends StatelessWidget {
  ma_home_page({super.key});

  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        key: scaffoldkey,
        appBar: AppBar(
          leading: Container(),
          title: const Text("Android"),
          centerTitle: true,
          actions: [
            Consumer<convertplatform>(
              builder: (context, provider, child) => Transform.scale(
                scale: 0.8,
                child: Switch(
                  value: provider.isAndroid,
                  onChanged: (value) {
                    provider.mechangeplatform(cuplatform: value);
                  },
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SizedBox(
                  height: s.height*0.05,
                  width: s.width,
                  // color: Colors.grey,
                  child: TabBar(
                    dragStartBehavior: DragStartBehavior.start,
                    indicatorSize: TabBarIndicatorSize.label,
                    onTap: (value) {},
                    tabs: const [
                      Tab(
                        icon: Icon(Icons.person_add_alt_outlined,
                            color: Colors.grey),
                      ),
                      Tab(
                        text: "CHATS",
                      ),
                      Tab(
                        text: "CALLS",
                      ),
                      Tab(
                        text: "SETTING",
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SizedBox(
                  height: s.height*0.82,
                  // width: s.width*0.5,
                  // color: Colors.grey,
                  child: TabBarView(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    dragStartBehavior: DragStartBehavior.down,
                    viewportFraction: 2,
                    children: [
                      // 1 Tab
                      ma_add_contact_page(),
                      // 2 Tab
                      ma_chat_page(),
                      // 3 Tab
                      const ma_call_page(),
                      // 4 Tab
                      const ma_setting_page(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
