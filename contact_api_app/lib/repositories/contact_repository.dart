import 'dart:math';

import '../models/contact_model.dart';

class ContactRepository{
  List<Contact> contacts = [
    Contact(id: 1, name: "Ahmad", groupe: "GLSID", profile: "AH"),
    Contact(id: 2, name: "Mohamed", groupe: "BDCC", profile: "MO"),
    Contact(id: 3, name: "Akram", groupe: "GLSID", profile: "AK"),
    Contact(id: 4, name: "Ali", groupe: "GLSID", profile: "AL"),
    Contact(id: 5, name: "Asmaa", groupe: "BDCC", profile: "AS"),
    Contact(id: 6, name: "Youssef", groupe: "BDCC", profile: "YO")
  ];

  Future<List<Contact>> allContact() async{
    var future = await Future.delayed(Duration(seconds: 1));
    int rand = Random().nextInt(10);
    if(rand>2)
    {return contacts;}
    else
    { throw Exception("Erreur de chargement des contacts");}
  }

  Future<List<Contact>> contactByGroup(String groupe) async{
    var future = await Future.delayed(Duration(seconds: 1));
    int rand = Random().nextInt(10);
    if(rand>2)
    {return contacts.where((element) => element.groupe==groupe).toList();}
    else
    { throw Exception("Erreur de chargement des contacts");}
  }


}