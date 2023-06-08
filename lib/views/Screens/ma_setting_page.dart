// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:platform_convertor_app/controllers/setting_controller.dart';
import 'package:provider/provider.dart';

class ma_setting_page extends StatelessWidget {
  const ma_setting_page({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Column(
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
                  const Icon(Icons.person, color: Colors.grey, size: 30),
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
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Switch(
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
                          CircleAvatar(
                            radius: 60,
                            child: Icon(Icons.add_a_photo_outlined,
                                size: s.height * 0.06),
                          ),
                          SizedBox(height: s.height * 0.02),
                          Row(
                            children: [
                              SizedBox(width: s.width * 0.3),
                              SizedBox(
                                height: s.height * 0.06,
                                width: s.width * 0.35,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter your name...',
                                  ),
                                ),
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
                                child: TextFormField(

                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter your Bio...',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [

                            ],
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        const SingleChildScrollView(child: Divider()),
        SingleChildScrollView(
          child: SizedBox(
            height: s.height * 0.1,
            width: s.width * 0.9,
            // color: Colors.grey,
            child: Row(
              children: [
                SizedBox(width: s.width * 0.05),
                const Icon(Icons.light_mode_outlined,
                    color: Colors.grey, size: 30),
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
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Switch(
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
  }
}

// Switch(
//   value: Provider.of<settingpagecontroller>(context,listen: false).getprofile,
//   onChanged: (value) {
//     Provider.of<settingpagecontroller>(context,listen: false).Expandprofile();
//     if (Provider.of<settingpagecontroller>(context,listen: false)
//         .Expandprofile()) {
//       Column(
//         children: const [
//           CircleAvatar(
//             radius: 50,
//           ),
//         ],
//       );
//     }else{
//       Column(
//         children: const [
//           CircleAvatar(
//             radius: 10,
//           ),
//         ],
//       );
//
//     }
//   },
// ),
