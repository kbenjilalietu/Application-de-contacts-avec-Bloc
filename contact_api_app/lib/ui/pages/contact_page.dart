
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/contact/contact_bloc.dart';
import '../../bloc/contact/contact_event.dart';
import '../../bloc/contact/contact_state.dart';
import '../widget_contact/button_reload.dart';
import '../widget_contact/list_contact.dart';

class ContactPage extends StatelessWidget {

  var myMenuItems = <String>['Tout', 'BDCC', 'GLSID',];

  @override
  Widget build(BuildContext context) {
    void onSelect(item) {
      switch (item) {
        case 'Tout':
          context.read<ContactBloc>().add(LoadAllContactsEvent());
          break;
        case 'BDCC':
          context.read<ContactBloc>().add(LoadBDCCContactsEvent());
          break;
        case 'GLSID':
          context.read<ContactBloc>().add(LoadGLSIDContactsEvent());
          break;
      }
    }
    return Scaffold(
          appBar: AppBar(
            title: const Text("Contact"),
            actions: <Widget>[
              PopupMenuButton<String>(
                  onSelected: onSelect,
                  itemBuilder: (BuildContext context) {
                    return myMenuItems.map((String choice) {
                      return PopupMenuItem<String>(
                        child: Text(choice),
                        value: choice,
                      );
                    }).toList();
                  })
            ],
          ),
          body:  Column(
            children: [
              BlocBuilder<ContactBloc,ContactState>(
                  builder: (context, state) {
                    if(state.requestState==RequestState.Loading){
                      return Column(
                        children: [
                          SizedBox(height: 200,),
                          Center(child: CircularProgressIndicator()),
                        ],
                      );
                    }else if(state.requestState==RequestState.Loaded){
                      return Expanded(
                        child: ListContact(state: state),
                      );
                    }else if(state.requestState==RequestState.Error){
                      return Column(
                        children: [
                          SizedBox(height: 200,),
                          Center(child: Text("${state.errorMessage}", style: TextStyle(fontSize: 18, ),textAlign: TextAlign.center,)),
                          SizedBox(height: 20,),
                          Center(child: ButtonReload(state: state,)),
                        ],
                      );
                    }
                    else{
                      return Center(child: Text("Aucun élément"),);
                    }
                  }),
            ],
          ),
        );
  }
}