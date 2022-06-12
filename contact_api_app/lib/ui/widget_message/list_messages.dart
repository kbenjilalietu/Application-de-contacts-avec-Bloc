import 'package:flutter/material.dart';

import '../../bloc/messages/message_state.dart';

class ListMessagesWidget extends StatelessWidget {
  final MessageState state;
  const ListMessagesWidget({Key? key,required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController=ScrollController();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if(scrollController.hasClients){
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
    return Expanded(
      child: ListView.builder(
         controller: scrollController,
          itemBuilder: (context, index) {
            return ListTile(
              title: Container(
                  margin:(state.messages[index].sent==true)?EdgeInsets.fromLTRB(30, 5, 0, 5) :EdgeInsets.fromLTRB(0, 5, 30, 5) ,
                  padding: EdgeInsets.all(20),
                  color: (state.messages[index].sent==true)?Colors.grey[50]:Colors.brown[50],
                  foregroundDecoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Text(state.messages[index].content,
                  )),
            );
          },
          itemCount: state.messages.length),
    );
  }
}
