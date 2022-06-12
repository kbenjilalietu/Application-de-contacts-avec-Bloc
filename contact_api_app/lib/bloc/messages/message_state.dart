
import '../../models/message_model.dart';
import '../contact/contact_state.dart';
import 'messages_event.dart';

class MessageState{
  List<Message> messages;
  RequestState requestState;
  String errorMessage;
  MessageEvent currentEvent;
  MessageState({required this.messages, this.requestState=RequestState.NONE, this.errorMessage="",required this.currentEvent});
}