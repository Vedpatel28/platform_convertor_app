// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:io';

class Contact {
  late String? name;
  late String? chat;
  late String? contact;
  late File? image;

  Contact({
    required this.name,
    required this.contact,
    required this.chat,
    this.image,
  });
}