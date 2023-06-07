import 'package:flutter/material.dart';

class ma_add_contact_page extends StatelessWidget {
  const ma_add_contact_page({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      height: s.height*0.4,
      color: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: s.height * 0.02),
            CircleAvatar(
              radius: s.height * 0.1,
            ),
            SizedBox(height: s.height * 0.02),
            SizedBox(
              height: s.height*0.08,
              width: s.width*0.9,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),

                  // icon: Icon(Icons.perm_identity_outlined),
                  label: Icon(Icons.perm_identity_outlined),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
