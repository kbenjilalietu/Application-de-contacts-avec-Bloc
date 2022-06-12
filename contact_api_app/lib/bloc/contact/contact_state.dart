import 'package:contact_api_app/bloc/contact/contact_event.dart';
import 'package:contact_api_app/models/contact_model.dart';

enum RequestState{Loaded,Loading,Error,NONE}

class ContactState{
  List<Contact> contacts;
  RequestState requestState;
  String errorMessage;
  ContactEvent currentEvent;
  ContactState({required this.contacts, required this.requestState, required this.errorMessage, required this.currentEvent});
}