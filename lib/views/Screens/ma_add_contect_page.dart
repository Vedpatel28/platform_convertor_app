// ignore_for_file: must_be_immutable, camel_case_types

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:platform_convertor_app/controllers/contact_controllers.dart';
import 'package:platform_convertor_app/modals/global_variables.dart';
import 'package:provider/provider.dart';

class ma_add_contact_page extends StatelessWidget {
  ma_add_contact_page({super.key});

  String? _name;
  String? _contact;
  String? _chat;
  String? _Image;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DateTime date = DateTime(0, 0, 0);

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: s.height * 0.02),
                // Image Add
                Stack(
                  children: [
                    Consumer<ContactStorController>(
                      builder: (context, pro, child) => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: s.height * 0.08,
                            foregroundImage: pro.image != null ? FileImage(pro.image!) : null,
                            child: IconButton(
                              onPressed: () async {
                                Directory? dir = await getExternalStorageDirectory();

                                File nImage = await pro.image!.copy("${dir!.path}/${_name}.jpg");

                                ImagePicker picker = ImagePicker();

                                XFile? img = await picker.pickImage(source: ImageSource.camera);

                                if (img != null) {
                                  pro.setImage(img: File(img.path));
                                }
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(Icons.add_a_photo_outlined, size: 40),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Full Name
                SizedBox(height: s.height * 0.02),
                // Full Name
                SizedBox(
                  height: s.height * 0.08,
                  width: s.width * 0.9,
                  child: TextFormField(
                    initialValue: AllGlobalVar.name,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Name";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (newValue) {
                      AllGlobalVar.name = newValue;
                      _name = newValue;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Full Name',
                      prefixIcon: Icon(Icons.perm_identity),
                      errorBorder: OutlineInputBorder(),
                    ),
                  ),
                ),
                // Phone Number
                SizedBox(height: s.height * 0.02),
                // Phone Number
                SizedBox(
                  height: s.height * 0.1,
                  width: s.width * 0.9,
                  child: TextFormField(
                    initialValue: AllGlobalVar.contact,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Contact";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (newValue) {
                      AllGlobalVar.contact = newValue;
                      _contact = newValue;
                    },
                    maxLength: 10,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Phone Number',
                      prefixIcon: Icon(Icons.phone),
                      errorBorder: OutlineInputBorder(),
                      // label: Icon(Icons.perm_identity_outlined),
                    ),
                  ),
                ),
                // Chat Conversation
                SizedBox(height: s.height * 0.02),
                // Chat Conversation
                Consumer<ContactStorController>(
                  builder: (context, pro, child) => SizedBox(
                    height: s.height * 0.08,
                    width: s.width * 0.9,
                    child: TextFormField(
                      initialValue: AllGlobalVar.chat,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Chat";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        AllGlobalVar.chat = newValue;
                        _chat = newValue;
                      },
                      onFieldSubmitted: (value) async {
                        Directory? dir = await getExternalStorageDirectory();

                        File nImage = await pro.image!.copy("${dir!.path}/${_name}.jpg");

                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          Provider.of<ContactStorController>(context, listen: false)
                              .addContact(name: _name!, contact: _contact!, chat: _chat!, image: nImage.path);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("SuccessFull Validate"),
                              backgroundColor: Colors.greenAccent,
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Error"),
                              backgroundColor: Colors.redAccent,
                            ),
                          );
                        }
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Chat Conversation',
                        prefixIcon: Icon(Icons.message_outlined),
                        errorBorder: OutlineInputBorder(),
                        // label: Icon(Icons.perm_identity_outlined),
                      ),
                    ),
                  ),
                ),
                // Pick Date
                GestureDetector(
                  onTap: () async {
                    // DateTime? NewDate = await
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1990),
                      lastDate: DateTime(2025),
                    );
                  },
                  child: SizedBox(
                    height: s.height * 0.05,
                    width: s.width * 0.95,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () async {
                              // DateTime? NewDate = await
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1990),
                                lastDate: DateTime(2025),
                              );
                            },
                            icon: const Icon(Icons.date_range_outlined)),
                        SizedBox(height: s.height * 0.02),
                        const Text("Pick Date"),
                      ],
                    ),
                  ),
                ),
                // Pick Time
                SizedBox(
                  height: s.height * 0.05,
                  width: s.width * 0.95,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                              title: Text("Select Time"),
                              content: TimePickerDialog(
                                initialTime: TimeOfDay(
                                  hour: 0,
                                  minute: 0,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.access_time_rounded,
                        ),
                      ),
                      SizedBox(height: s.height * 0.02),
                      const Text("Pick Time")
                    ],
                  ),
                ),
                // Save Button
                OutlinedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      Provider.of<ContactStorController>(context, listen: false).addContact(
                        name: _name!,
                        contact: _contact!,
                        chat: _chat!,
                        image: _Image!,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("SuccessFull Validate"),
                          backgroundColor: Colors.greenAccent,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Error"),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                    }
                  },
                  child: const Text("Save"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
