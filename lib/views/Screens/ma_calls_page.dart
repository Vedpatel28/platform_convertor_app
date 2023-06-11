// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:platform_convertor_app/controllers/contact_controllers.dart';
import 'package:platform_convertor_app/views/modals/global_variables.dart';
import 'package:provider/provider.dart';

class ma_call_page extends StatelessWidget {
  const ma_call_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          itemCount: AllGlobalVar.name!.length,
          itemBuilder: (context, index) =>
              Consumer<ContactStorController>(
                builder: (context, pro,child) => ListTile(
                    title: Text("${pro.getAllContact[index].name}"),
                  )
              ),
        ),
      ],
    );
  }
}
