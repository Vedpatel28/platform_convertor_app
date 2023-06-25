// ignore_for_file: camel_case_types

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_convertor_app/controllers/contact_controllers.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ma_call_page extends StatelessWidget {
  const ma_call_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactStorController>(
      builder: (context, pro, child) => Column(
        children: [
          SizedBox(
            height: 500,
            width: 400,
            child: ListView.builder(
              itemCount: pro.getAllContact.length,
              itemBuilder: (context, index) => ListTile(
                // title: Text("${pro.getAllContact[index].name}"),
                // subtitle: Text("${pro.getAllContact[index].contact}"),
                leading: CircleAvatar(
                  foregroundImage:
                      FileImage(pro.getAllContact[index].image as File),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Uri call = Uri(
                      scheme: 'tel',
                      path: pro.getAllContact[index].contact,
                    );
                    launchUrl(call);
                  },
                  icon: const Icon(
                    Icons.call,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
