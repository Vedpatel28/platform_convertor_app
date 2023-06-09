import 'dart:html';

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