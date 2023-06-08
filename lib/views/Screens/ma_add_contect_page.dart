// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class ma_add_contact_page extends StatelessWidget {
  ma_add_contact_page({super.key});

  DateTime date = DateTime(0, 0, 0);

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return SizedBox(
      height: s.height * 0.4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
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
                  DateTime? NewDate = await showDatePicker(
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
                            DateTime? NewDate = await showDatePicker(
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
                        onPressed: () {},
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
                onPressed: () {},
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
