// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:platform_convertor_app/controllers/contact_controllers.dart';
import 'package:provider/provider.dart';

class ma_chat_page extends StatelessWidget {
  ma_chat_page({super.key});

  String? _name;
  String? _contact;
  String? _chat;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DateTime date = DateTime(0, 0, 0);

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Consumer<ContactStorController>(
      builder: (context, pro, child) => Column(
        children: [
          SizedBox(
            height: 500,
            width: 400,
            child: ListView.builder(
              itemCount: pro.getAllContact.length,
              itemBuilder: (context, index) => ListTile(
                title: Text("${pro.getAllContact[index].name}"),
                subtitle: Text("${pro.getAllContact[index].contact}"),
                trailing: Text("${pro.getAllContact[index].chat}"),
                // leading: const CircleAvatar(
                //   child: Icon(Icons.image),
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
