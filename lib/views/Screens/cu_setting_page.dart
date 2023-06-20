// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:platform_convertor_app/controllers/convertor_controller.dart';
import 'package:platform_convertor_app/controllers/setting_controller.dart';
import 'package:provider/provider.dart';

class cu_setting_page extends StatelessWidget {
  const cu_setting_page({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: s.height * 0.15),
            SizedBox(
              width: s.width * 0.9,
              height:
                  (Provider.of<settingpagecontroller>(context, listen: false)
                          .profileSwitch)
                      ? s.height * 0.42
                      : s.height * 0.1,
              child: Column(
                children: [
                  SizedBox(height: s.height * 0.01),
                  Row(
                    children: [
                      SizedBox(width: s.width * 0.05),
                      const Icon(
                        CupertinoIcons.person,
                        size: 30,
                      ),
                      SizedBox(width: s.width * 0.06),
                      // Profile / Update Profile Data
                      const Text.rich(
                        TextSpan(
                          children: [
                            // Theme
                            TextSpan(
                              text: 'Profile \n',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Change Theme
                            TextSpan(
                              text: 'Update Profile Data',
                              style: TextStyle(
                                  color: CupertinoColors.inactiveGray,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      CupertinoSwitch(
                        value: Provider.of<settingpagecontroller>(context,
                                listen: true)
                            .profileSwitch,
                        onChanged: (value) {
                          Provider.of<settingpagecontroller>(context,
                                  listen: false)
                              .Expandprofile();
                        },
                      ),
                    ],
                  ),
                  (Provider.of<settingpagecontroller>(context, listen: false)
                          .profileSwitch)
                      ? SingleChildScrollView(
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  SizedBox(height: s.height * 0.02),
                                  Container(
                                    height: s.height * 0.16,
                                    width: s.width * 0.33,
                                    decoration: BoxDecoration(
                                      color: CupertinoColors.link,
                                      borderRadius: BorderRadius.circular(200),
                                    ),
                                  ),
                                  SizedBox(height: s.height * 0.02),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        // height: s.height*0.1,
                                        width: s.width * 0.35,
                                        child: const CupertinoTextField(
                                          textInputAction: TextInputAction.next,
                                          suffixMode:
                                              OverlayVisibilityMode.notEditing,
                                          style: TextStyle(
                                              color:
                                                  CupertinoColors.inactiveGray),
                                          textAlign: TextAlign.center,
                                          suffix: Text(
                                            "Enter your name...",
                                            style: TextStyle(
                                              color:
                                                  CupertinoColors.inactiveGray,
                                            ),
                                          ),
                                          decoration: BoxDecoration(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        // height: s.height*0.1,
                                        width: s.width * 0.3,
                                        child: const CupertinoTextField(
                                          textInputAction: TextInputAction.next,
                                          suffixMode:
                                              OverlayVisibilityMode.notEditing,
                                          style: TextStyle(
                                              color:
                                                  CupertinoColors.inactiveGray),
                                          textAlign: TextAlign.center,
                                          suffix: Text(
                                            "Enter your bio...",
                                            style: TextStyle(
                                              color:
                                                  CupertinoColors.inactiveGray,
                                            ),
                                          ),
                                          decoration: BoxDecoration(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              /*
                              SizedBox(height: s.height * 0.02),
                              Container(
                                height: s.height * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(
                                  CupertinoIcons.photo_camera,
                                  size: s.height * 0.06,
                                ),
                              ),
                              SizedBox(height: s.height * 0.02),
                              Row(
                                children: [
                                  SizedBox(width: s.width * 0.3),
                                  SizedBox(
                                    height: s.height * 0.06,
                                    width: s.width * 0.35,
                                    child: const CupertinoTextField(),
                                  ),
                                ],
                              ),
                              SizedBox(height: s.height * 0.01),
                              Row(
                                children: [
                                  SizedBox(width: s.width * 0.32),
                                  SizedBox(
                                    height: s.height * 0.06,
                                    width: s.width * 0.35,
                                    child: const CupertinoTextField(),
                                  ),
                                ],
                              ),
                              Row(
                                children: [],
                              ),*/

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CupertinoButton(
                                    child: const Text("SAVE"),
                                    onPressed: () {},
                                  ),
                                  CupertinoButton(
                                    child: const Text("CLEAR"),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: s.height * 0.1,
                width: s.width * 0.9,
                // color: Colors.grey,
                child: Row(
                  children: [
                    SizedBox(width: s.width * 0.05),
                    const Icon(CupertinoIcons.brightness, size: 30),
                    SizedBox(width: s.width * 0.06),
                    // Theme / Change Theme
                    const Text.rich(
                      TextSpan(
                        children: [
                          // Theme
                          TextSpan(
                            text: 'Theme\n',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Change Theme
                          TextSpan(
                            text: 'Change Theme',
                            style: TextStyle(
                                color: CupertinoColors.inactiveGray,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    CupertinoSwitch(
                      value: Provider.of<settingpagecontroller>(context,
                              listen: true)
                          .getTheme,
                      onChanged: (value) {
                        Provider.of<settingpagecontroller>(context,
                                listen: false)
                            .changetheme();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    /*
      Column(
      children: [
        SizedBox(height: s.height * 0.02),
        SizedBox(
          width: s.width * 0.9,
          height: (Provider.of<settingpagecontroller>(context, listen: false)
                  .profileSwitch)
              ? s.height * 0.5
              : s.height * 0.1,
          child: Column(
            children: [
              SizedBox(height: s.height * 0.01),
              Row(
                children: [
                  SizedBox(width: s.width * 0.05),
                  const Icon(CupertinoIcons.person,
                      color: CupertinoColors.activeGreen, size: 30),
                  SizedBox(width: s.width * 0.06),
                  // Profile / Update Profile Data
                  const Text.rich(
                    TextSpan(
                      children: [
                        // Theme
                        TextSpan(
                          text: 'Profile \n',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Change Theme
                        TextSpan(
                          text: 'Update Profile Data',
                          style: TextStyle(
                              color: CupertinoColors.inactiveGray,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  CupertinoSwitch(
                    value: Provider.of<settingpagecontroller>(context,
                            listen: false)
                        .profileSwitch,
                    onChanged: (value) {
                      Provider.of<settingpagecontroller>(context, listen: false)
                          .Expandprofile();
                    },
                  ),
                ],
              ),
              (Provider.of<settingpagecontroller>(context, listen: false)
                      .profileSwitch)
                  ? SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: s.height * 0.02),
                          Container(
                            height: s.height * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(
                              CupertinoIcons.photo_camera,
                              size: s.height * 0.06,
                            ),
                          ),
                          SizedBox(height: s.height * 0.02),
                          Row(
                            children: [
                              SizedBox(width: s.width * 0.3),
                              SizedBox(
                                height: s.height * 0.06,
                                width: s.width * 0.35,
                                child: const CupertinoTextField(),
                              ),
                            ],
                          ),
                          SizedBox(height: s.height * 0.01),
                          Row(
                            children: [
                              SizedBox(width: s.width * 0.32),
                              SizedBox(
                                height: s.height * 0.06,
                                width: s.width * 0.35,
                                child: const CupertinoTextField(),
                              ),
                            ],
                          ),
                          Row(
                            children: [],
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        SingleChildScrollView(
          child: SizedBox(
            height: s.height * 0.1,
            width: s.width * 0.9,
            // color: Colors.grey,
            child: Row(
              children: [
                SizedBox(width: s.width * 0.05),
                const Icon(CupertinoIcons.brightness,
                    color: CupertinoColors.inactiveGray, size: 30),
                SizedBox(width: s.width * 0.06),
                // Theme / Change Theme
                const Text.rich(
                  TextSpan(
                    children: [
                      // Theme
                      TextSpan(
                        text: 'Theme\n',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Change Theme
                      TextSpan(
                        text: 'Change Theme',
                        style: TextStyle(
                            color: CupertinoColors.inactiveGray,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                CupertinoSwitch(
                  value:
                      Provider.of<settingpagecontroller>(context, listen: false)
                          .getTheme,
                  onChanged: (value) {
                    Provider.of<settingpagecontroller>(context, listen: false)
                        .changetheme();
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
    */
  }
}
