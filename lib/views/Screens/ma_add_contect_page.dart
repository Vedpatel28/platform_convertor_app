import 'package:flutter/material.dart';
import 'package:platform_convertor_app/controllers/contact_controllers.dart';
import 'package:platform_convertor_app/utils/routes_utils.dart';
import 'package:platform_convertor_app/views/modals/global_variables.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
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
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: s.height * 0.02),
            // Image Add
            CircleAvatar(
              radius: s.height * 0.08,
              // child: IconButton(
              //   onPressed: () {},
              //   icon: const Icon(Icons.add_a_photo_outlined, size: 40),
              // ),
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
                  // _name = newValue;
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
                  // _contact = newValue;
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
                  // _chat = newValue;
                },
                onFieldSubmitted: (value) {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    Provider.of<ContactStorController>(context).addContact(name: _name!, contact: _contact!, chat: _chat!);
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
                  Provider.of<ContactStorController>(context).addContact(name: _name!, contact: _contact!, chat: _chat!);
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

                // if (formkey.currentState!.validate()) {
                //   formkey.currentState!.save();
                //   allGlobalvar.allContact.add(
                //     contacts(
                //       firstname: allGlobalvar.Fname!,
                //       lastname: allGlobalvar.Lname!,
                //       Contact: allGlobalvar.Pnumber!,
                //       email: allGlobalvar.Email!,
                //       image: allGlobalvar.image!,
                //     ),
                //   );
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     errorsnackBar(
                //       text: "Successfully Add Contact",
                //       color: Colors.green,
                //     ),
                //   );
                // } else {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     errorsnackBar(
                //         text: "Sum thing Error !!", color: Colors.redAccent),
                //   );
                // }
                // Navigator.of(context).pop();
                //
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
    );
  }
}
