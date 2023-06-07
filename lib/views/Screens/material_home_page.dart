import 'package:flutter/material.dart';
import 'package:platform_convertor_app/controllers/convertor_controller.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ANhomepage extends StatelessWidget {
  ANhomepage({super.key});

  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        leading: Container(),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                scaffoldkey.currentState!.showBottomSheet(
                  (context) => Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                  ),
                );
              },
              child: const Text("Show Bottom Sheet"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    height: 250,
                    decoration: const BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25),
                      ),
                    ),
                  ),
                );
              },
              child: const Text("Show Modal Bottom Sheet"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
