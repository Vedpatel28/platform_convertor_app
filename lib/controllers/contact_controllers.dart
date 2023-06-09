import 'package:flutter/material.dart';
import 'package:platform_convertor_app/views/modals/modal_allcontact_class.dart';
import 'package:platform_convertor_app/views/modals/modal_profile_class.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactStorController extends ChangeNotifier {
  SharedPreferences pref;

  ContactStorController({required this.pref});

  final String _sfName = "all_name";
  final String _sfContact = "all_contact";
  final String _sfChat = "all_Chat";

  final String _sfProName = "all_Pro_Name";
  final String _sfProBio = "all_Pro_Bio";

  List<String> _allName = [];
  List<String> _allContact = [];
  List<String> _allChat = [];

  List<String> _allProName = [];
  List<String> _allProBio = [];

  List<Contact> allContact = [];

  List<Contact> allProContact = [];

  // ADD Contact Page

  List<Contact> get getAllContact {
    _allName = pref.getStringList(_sfName) ?? [];
    _allContact = pref.getStringList(_sfContact) ?? [];
    _allChat = pref.getStringList(_sfChat) ?? [];

    allContact = List.generate(
      _allName.length,
      (index) => Contact(
        name: _allName[index],
        contact: _allContact[index],
        chat: _allChat[index],
      ),
    );
    return allContact;
  }

  void addContact(
      {required String name, required String contact, required String chat}) {
    _allName = pref.getStringList(_sfName) ?? [];
    _allContact = pref.getStringList(_sfContact) ?? [];
    _allChat = pref.getStringList(_sfChat) ?? [];

    _allName.add(name);
    _allContact.add(contact);
    _allChat.add(chat);

    pref.setStringList(_sfName, _allName);
    pref.setStringList(_sfContact, _allContact);
    pref.setStringList(_sfChat, _allChat);
  }

  // Setting Page

  // List<ProFileInfo> get getProContact {
  //   _allProName = pref.getStringList(_sfProName) ?? [];
  //   _allProBio = pref.getStringList(_sfProBio) ?? [];
  //
  //   allProContact = List.generate(
  //     _allProName.length,
  //     (index) => ProFileInfo(
  //       proName: _allProName,
  //       proBio: _allProBio,
  //     ),
  //   );
  //   return allProContact;
  // }

  void addProContact({required String proName, required String proBio}) {
    _allProName = pref.getStringList(_sfProName) ?? [];
    _allProBio = pref.getStringList(_sfProBio) ?? [];

    _allName.add(proName);
    _allContact.add(proBio);

    pref.setStringList(_sfProName, _allProName);
    pref.setStringList(_sfProBio, _allProBio);
  }
}
