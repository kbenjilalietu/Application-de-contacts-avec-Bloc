import '../../models/contact_model.dart';
import '../../models/message_model.dart';

abstract class MessageEvent{

}

class ContactMessagesEvent extends MessageEvent{
  Contact contact;
  ContactMessagesEvent({required this.contact});
}
class AddMessageEvent extends MessageEvent{
  Message message;

  AddMessageEvent({required this.message});
}