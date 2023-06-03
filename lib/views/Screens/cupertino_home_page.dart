import 'package:flutter/cupertino.dart';
import 'package:platform_convertor_app/controllers/convertor_controller.dart';
import 'package:provider/provider.dart';

class IOhomepage extends StatelessWidget {
  const IOhomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("IOS"),
        trailing: Consumer<convertplatform>(
          builder: (context, provider, child) => Transform.scale(
            scale: 0.8,
            child: CupertinoSwitch(
              value: provider.isAndroid,
              onChanged: (value) {
                provider.mechangeplatform(cuplatform: value);
              },
            ),
          ),
        ),
      ),
      child: Center(
        child: Column(
          children: const [
            Spacer(),
            Text("IOS"),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
