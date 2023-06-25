// ignore_for_file: must_be_immutable, camel_case_types, use_build_context_synchronously, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:platform_convertor_app/controllers/contact_controllers.dart';
import 'package:platform_convertor_app/controllers/date_time_controller.dart';
import 'package:provider/provider.dart';

class ma_add_contact_page extends StatelessWidget {
  ma_add_contact_page({super.key});

  String? _name;
  String? _contact;
  String? _chat;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DateTime date = DateTime.now();

  ImagePicker ImagePic = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: s.height * 0.02),
                    // Image Add
                    SingleChildScrollView(
                      child: Consumer<ContactStorController>(
                        builder: (context, pro, child) => Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: s.height * 0.09,
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
                                          icon: const Icon(Icons
                                              .add_photo_alternate_outlined),
                                          elevation: 4,
                                          buttonPadding:
                                              const EdgeInsets.all(12),
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
                                                        source: ImageSource
                                                            .gallery);
                                                if (img != null) {
                                                  pro.setImage(
                                                      img: File(img.path));
                                                }
                                              },
                                              label: const Text("Gallery"),
                                              icon: const Icon(
                                                  Icons.photo_library),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.add_a_photo_outlined,
                                        size: 40),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Full Name
                    SizedBox(height: s.height * 0.02),
                    // Full Name
                    TextFormField(
                      initialValue: _name,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Name";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        _name = newValue;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Full Name',
                        prefixIcon: Icon(Icons.perm_identity),
                        errorBorder: OutlineInputBorder(),
                      ),
                    ),
                    // Phone Number
                    SizedBox(height: s.height * 0.02),
                    // Phone Number
                    TextFormField(
                      initialValue: _contact,
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
                    // Chat Conversation
                    SizedBox(height: s.height * 0.02),
                    // Chat Conversation
                    TextFormField(
                      initialValue: _chat,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Chat";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        _chat = newValue;
                      },
                      onFieldSubmitted: (value) async {
                        Directory? dir = await getExternalStorageDirectory();
                        File nImage =
                            await Provider.of<ContactStorController>(context)
                                .image!
                                .copy("${dir!.path}/$_name.jpg");
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          Provider.of<ContactStorController>(context,
                                  listen: false)
                              .addContact(
                            name: _name!,
                            contact: _contact!,
                            chat: _chat!,
                            image: nImage.path,
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
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Chat Conversation',
                        prefixIcon: Icon(Icons.message_outlined),
                        errorBorder: OutlineInputBorder(),
                        // label: Icon(Icons.perm_identity_outlined),
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
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () => showDialog(
                                    context: context,
                                    builder: Provider.of<DateTimeController>(
                                            context,
                                            listen: false)
                                        .picked(context: context),
                                  ),
                              icon: const Icon(Icons.date_range_outlined)),
                          SizedBox(height: s.height * 0.02),
                          const Text("Pick Date"),
                        ],
                      ),
                    ),
                    // Pick Time
                    Row(
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
                    // Save Button
                    OutlinedButton(
                      onPressed: () async {
                        Directory? dir = await getExternalStorageDirectory();
                        File nImage =
                            await Provider.of<ContactStorController>(context)
                                .image!
                                .copy("${dir!.path}/$_name.jpg");
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          Provider.of<ContactStorController>(context,
                                  listen: false)
                              .addContact(
                            name: _name!,
                            contact: _contact!,
                            chat: _chat!,
                            image: nImage.path,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
