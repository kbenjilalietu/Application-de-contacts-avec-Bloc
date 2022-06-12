import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/contact/contact_state.dart';
import '../../bloc/messages/message_bloc.dart';
import '../../bloc/messages/messages_event.dart';

class ListContact extends StatelessWidget{
  final ContactState state;
  const ListContact({Key? key,required this.state}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(2, 10, 2, 2),
            child: ListView.builder(
                    itemCount: state.contacts.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                              leading: CircleAvatar(child: Text(state.contacts[index].profile)),
                              title: Text(state.contacts[index].groupe),
                              subtitle: Text(state.contacts[index].name),
                              trailing: IconButton(onPressed: ()
                              {
                                context.read<MessageBloc>().add(ContactMessagesEvent(contact: state.contacts[index]));
                                Navigator.pushNamed(context, "/messages",arguments:state.contacts[index] );
                              }, icon: Icon(Icons.message_outlined, color: Colors.black12,))
                          ),
                        ),
                      );
                    })));
  }

}