import 'dart:io';

class ProFileInfo {
  late String? proName;
  late String? proBio;
  late File? proImage;

  ProFileInfo({
    required this.proName,
    required this.proBio,
    this.proImage,
  });
}
