import 'package:bloc/bloc.dart';
import 'package:contact_api_app/bloc/contact/contact_event.dart';
import 'package:contact_api_app/bloc/contact/contact_state.dart';
import 'package:contact_api_app/repositories/contact_repository.dart';

import '../../models/contact_model.dart';


class ContactBloc extends Bloc<ContactEvent,ContactState>{
  ContactRepository contactRepository;
  ContactBloc(ContactState contactState, this.contactRepository):super(contactState){

    on<LoadAllContactsEvent>((event, emit) async
    {
      emit(ContactState(contacts: [], requestState: RequestState.Loading, errorMessage: "", currentEvent: event));
      try{
        List<Contact> contacts = await contactRepository.allContact();
        emit(ContactState(contacts: contacts, requestState: RequestState.Loaded, errorMessage: "", currentEvent: event));
      }catch(e){
        emit(ContactState(contacts: [], requestState: RequestState.Error, errorMessage: e.toString(), currentEvent: event));
      }
    });

    on<LoadBDCCContactsEvent>((event, emit) async {
      emit(ContactState(contacts: [],requestState: RequestState.Loading,errorMessage: "", currentEvent: event));
      try{
        List<Contact> contacts= await contactRepository.contactByGroup("BDDC");
        emit(ContactState(contacts: contacts,requestState: RequestState.Loaded,errorMessage: "", currentEvent: event));
      }catch(e){
        emit(ContactState(contacts: [],requestState: RequestState.Error,errorMessage: e.toString(), currentEvent: event));
      }
    });

    on<LoadGLSIDContactsEvent>((event, emit) async{
      emit(ContactState(contacts: [],requestState: RequestState.Loading,errorMessage: "", currentEvent: event));
      try{
        List<Contact> contacts= await contactRepository.contactByGroup("GLSID");
        emit(ContactState(contacts: contacts,requestState: RequestState.Loaded,errorMessage: "", currentEvent: event));
      }catch(e){
        emit(ContactState(contacts: [],requestState: RequestState.Error,errorMessage: e.toString(), currentEvent: event));
      }

   });
  }
}