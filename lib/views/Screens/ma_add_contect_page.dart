// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:platform_convertor_app/controllers/contact_controllers.dart';
import 'package:platform_convertor_app/utils/routes_utils.dart';
import 'package:platform_convertor_app/views/modals/global_variables.dart';
import 'package:provider/provider.dart';

class ma_add_contact_page extends StatelessWidget {
  ma_add_contact_page({super.key});

  String? _name;
  String? _contact;
  String? _chat;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DateTime date = DateTime(0, 0, 0);

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        height: s.height * 0.8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: s.height * 0.02),
                // Image Add
                CircleAvatar(
                  radius: s.height * 0.08,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_a_photo_outlined, size: 40),
                  ),
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
                      _name = newValue;
                      AllGlobalVar.name = newValue;
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
                  height: s.height * 0.08,
                  width: s.width * 0.9,
                  child: TextFormField(
                    initialValue: AllGlobalVar.contact,
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
                SizedBox(
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
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Chat Conversation',
                      prefixIcon: Icon(Icons.message_outlined),
                      errorBorder: OutlineInputBorder(),
                      // label: Icon(Icons.perm_identity_outlined),
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
                  child: Container(
                    height: s.height * 0.05,
                    width: s.width * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
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
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const AlertDialog(
                        content: TimePickerDialog(
                          initialTime: TimeOfDay(
                            hour: 0,
                            minute: 0,
                          ),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: s.height * 0.05,
                    width: s.width * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
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
                ),
                // Save Button
                OutlinedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      Provider.of<ContactStorController>(context).addContact(
                          name: _name!, contact: _contact!, chat: _chat!);
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
                    // if () {
                    //   Provider.of<ContactStorController>(context, listen: false)
                    //       .addContact(
                    //           name: _name!, contact: _contact!, chat: _chat!);
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(
                    //       content: Text("SuccessFull Validate"),
                    //       backgroundColor: Colors.greenAccent,
                    //     ),
                    //   );
                    // } else
                    // Navigator.of(context).pushNamed(allroutes.MaCallsPage);
                  },
                  child: const Text("Save"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
