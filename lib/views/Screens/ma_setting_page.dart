// ignore_for_file: camel_case_types, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:platform_convertor_app/controllers/contact_controllers.dart';
import 'package:platform_convertor_app/controllers/setting_controller.dart';
import 'package:provider/provider.dart';

class ma_setting_page extends StatelessWidget {
  ma_setting_page({super.key});

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  ImagePicker ImagePic = ImagePicker();

  String? _name;
  String? _bio;

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
                      child: Consumer<ContactStorController>(
                        builder: (context, pro, child) => Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: s.height * 0.03),
                              CircleAvatar(
                                radius: s.height * 0.08,
                                foregroundImage: pro.image != null
                                    ? FileImage(pro.image!)
                                    : null,
                                child: IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        alignment: Alignment.center,
                                        shadowColor: Colors.black,
                                        shape: UnderlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        title: const Text(
                                          "Select For Add Image",
                                        ),
                                        icon: const Icon(
                                            Icons.add_photo_alternate_outlined),
                                        elevation: 4,
                                        buttonPadding: const EdgeInsets.all(12),
                                        content: Container(
                                          height: s.height * 0.1,
                                          alignment: Alignment.center,
                                          child: const Text(
                                              "Click Camera 📷 Button For Add Live Photo.\n"
                                              "Click Gallery 🌌 Button For Add all ready Clicked Photo.\n"),
                                        ),
                                        actions: [
                                          ElevatedButton.icon(
                                            onPressed: () async {
                                              Navigator.of(context).pop();
                                              XFile? img =
                                                  await ImagePic.pickImage(
                                                      source:
                                                          ImageSource.camera);
                                              if (img != null) {
                                                pro.setImage(
                                                    img: File(img.path));
                                              }
                                            },
                                            label: const Text("Camera"),
                                            icon: const Icon(
                                                Icons.camera_alt_outlined),
                                          ),
                                          ElevatedButton.icon(
                                            onPressed: () async {
                                              Navigator.of(context).pop();
                                              XFile? img =
                                                  await ImagePic.pickImage(
                                                      source:
                                                          ImageSource.gallery);
                                              if (img != null) {
                                                pro.setImage(
                                                    img: File(img.path));
                                              }
                                            },
                                            label: const Text("Gallery"),
                                            icon:
                                                const Icon(Icons.photo_library),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.add_a_photo_outlined,
                                      size: 40),
                                ),
                              ),
                              SizedBox(height: s.height * 0.02),
                              // Name
                              Row(
                                children: [
                                  SizedBox(width: s.width * 0.3),
                                  SizedBox(
                                    height: s.height * 0.06,
                                    width: s.width * 0.35,
                                    child: TextFormField(
                                      initialValue: _name,
                                      textInputAction: TextInputAction.next,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return null;
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (newValue) {
                                        _name = newValue;
                                      },
                                      textAlign: TextAlign.center,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Enter your name...',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: s.height * 0.01),
                              // Bio
                              Row(
                                children: [
                                  SizedBox(width: s.width * 0.32),
                                  SizedBox(
                                    height: s.height * 0.06,
                                    width: s.width * 0.35,
                                    child: TextFormField(
                                      initialValue: _bio,
                                      textInputAction: TextInputAction.next,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return null;
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (newValue) {
                                        _bio = newValue;
                                      },
                                      textAlign: TextAlign.center,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Enter your Bio...',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // SAVE / CLEAR
                              Row(
                                children: [
                                  const Spacer(flex: 5),
                                  TextButton(
                                    onPressed: () async {
                                      Directory? dir =
                                          await getExternalStorageDirectory();
                                      File nImage = await Provider.of<
                                              ContactStorController>(context)
                                          .image!
                                          .copy("${dir!.path}/$_name.jpg");
                                      if (formkey.currentState!.validate()) {
                                        formkey.currentState!.save();
                                        Provider.of<ContactStorController>(
                                                context,
                                                listen: false)
                                            .addProContact(
                                          proName: _name!,
                                          proBio: _bio!,
                                          proImage: nImage.path,
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text("SuccessFull Validate"),
                                            backgroundColor: Colors.greenAccent,
                                          ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text("Error"),
                                            backgroundColor: Colors.redAccent,
                                          ),
                                        );
                                      }
                                    },
                                    child: const Text("SAVE"),
                                  ),
                                  const Spacer(),
                                  TextButton(
                                    onPressed: () {

                                    },
                                    child: const Text("CLEAR"),
                                  ),
                                  const Spacer(flex: 5),
                                ],
                              ),
                            ],
                          ),
                        ),
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