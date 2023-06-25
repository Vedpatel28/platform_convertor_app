import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_convertor_app/modals/modal_allcontact_class.dart';
import 'package:platform_convertor_app/modals/modal_profile_class.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactStorController extends ChangeNotifier {
  SharedPreferences pref;

  ContactStorController({required this.pref});

  final String _sfName = "all_name";
  final String _sfContact = "all_contact";
  final String _sfChat = "all_Chat";
  final String _sfImage = "all_Chat";

  final String _sfProName = "all_Pro_Name";
  final String _sfProBio = "all_Pro_Bio";
  final String _sfProImage = "all_Pro_Bio";

  List<String> _allName = [];
  List<String> _allContact = [];
  List<String> _allChat = [];
  List<String> _allImage = [];

  File? image;

  List<String> _allProName = [];
  List<String> _allProBio = [];
  List<String> _allProImage = [];

  List<Contact> allContact = [];

  List<ProFileInfo> allProContact = [];

  // ADD Contact Page

  void setImage({required File img}) {
    image = img;
    notifyListeners();
  }

  List<Contact> get getAllContact {
    _allName = pref.getStringList(_sfName) ?? [];
    _allContact = pref.getStringList(_sfContact) ?? [];
    _allChat = pref.getStringList(_sfChat) ?? [];
    _allImage = pref.getStringList(_sfImage) ?? [];

    allContact = List.generate(
      _allName.length,
      (index) => Contact(
        name: _allName[index],
        contact: _allContact[index],
        chat: _allChat[index],
        image: _allImage[index],
      ),
    );
    return allContact;
  }

  void addContact(
      {required String name,
      required String contact,
      required String chat,
      required String? image}) {
    _allName = pref.getStringList(_sfName) ?? [];
    _allContact = pref.getStringList(_sfContact) ?? [];
    _allChat = pref.getStringList(_sfChat) ?? [];
    _allImage = pref.getStringList(_sfImage) ?? [];

    _allName.add(name);
    _allContact.add(contact);
    _allChat.add(chat);
    _allImage.add(image!);

    pref.setStringList(_sfName, _allName);
    pref.setStringList(_sfContact, _allContact);
    pref.setStringList(_sfChat, _allChat);
    pref.setStringList(_sfImage, _allImage);
  }

  // Setting Page

  List<ProFileInfo> get getProContact {
    _allProName = pref.getStringList(_sfProName) ?? [];
    _allProBio = pref.getStringList(_sfProBio) ?? [];

    allProContact = List.generate(
      _allProName.length,
      (index) => ProFileInfo(
        proName: _allProName[index],
        proBio: _allProBio[index],
        proImage: _allProImage[index],
      ),
    );
    return allProContact;
  }



  void addProContact(
      {required String proName,
      required String proBio,
      required String proImage}) {
    _allProName = pref.getStringList(_sfProName) ?? [];
    _allProBio = pref.getStringList(_sfProBio) ?? [];
    _allProImage = pref.getStringList(_sfProImage) ?? [];

    _allName.add(proName);
    _allContact.add(proBio);
    _allImage.add(proImage);

    pref.setStringList(_sfProName, _allProName);
    pref.setStringList(_sfProBio, _allProBio);
    pref.setStringList(_sfProImage, _allProImage);
  }
}
