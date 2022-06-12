import 'package:bloc/bloc.dart';

import '../../models/message_model.dart';
import '../../repositories/message_repository.dart';
import '../contact/contact_state.dart';
import 'message_state.dart';
import 'messages_event.dart';

class MessageBloc extends Bloc<MessageEvent,MessageState>{
  MessageRepository messageRepository;
  MessageBloc({required MessageState initialState,required this.messageRepository}) : super(initialState){

    on((event, emit) async{
      if(event is ContactMessagesEvent){
        emit(MessageState(messages: [],requestState: RequestState.Loading,currentEvent: event));
       try{
         List<Message> messages=await messageRepository.messagesByContact(event.contact.id);
         emit(MessageState(messages: messages,requestState: RequestState.Loaded,currentEvent: event));
       }catch(e){
         emit(MessageState(messages: [],requestState: RequestState.Error,errorMessage: e.toString(),currentEvent: event));
       }
      }else if(event is AddMessageEvent){
        emit(MessageState(messages: [],requestState: RequestState.Loading,currentEvent: event));
        try{
          messageRepository.addMessage(event.message);
          List<Message> messages=await messageRepository.messagesByContact(event.message.idContact);
          emit(MessageState(messages: messages,requestState: RequestState.Loaded,currentEvent: event));
        }catch(e){
          emit(MessageState(messages: [],requestState: RequestState.Error,errorMessage: e.toString(),currentEvent: event));
        }
      }
    });
  }


}