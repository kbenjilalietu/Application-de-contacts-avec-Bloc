import 'package:contact_api_app/bloc/contact/contact_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/contact/contact_bloc.dart';

class DrawerItem extends StatelessWidget{
  final String route;
  final Icon icon;
  final String title;
  const DrawerItem(this.route, this.icon, this.title, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      onTap: (){
        if(route=="/contact")
          {
            context.read<ContactBloc>().add(LoadAllContactsEvent());
          }
        Navigator.popAndPushNamed(context, route);
      },
      leading: icon,
      title: Text(title),
    );
  }

}