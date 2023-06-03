import 'package:flutter/material.dart';
import 'package:platform_convertor_app/controllers/convertor_controller.dart';
import 'package:provider/provider.dart';

class ANhomepage extends StatelessWidget {
  const ANhomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Android"),
        centerTitle: true,
        actions: [
          Consumer<convertplatform>(
            builder: (context, provider, child) => Transform.scale(
              scale: 0.8,
              child: Switch(
                value: provider.isAndroid,
                onChanged: (value) {
                  provider.mechangeplatform(cuplatform: value);
                },
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: const [
            Spacer(),
            Text("Android"),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
