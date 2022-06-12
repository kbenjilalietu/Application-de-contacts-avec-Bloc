import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'drawer_item.dart';

class AppDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Column(
            children: const [
              CircleAvatar(
                radius : 50,
                backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/81255636?v=4"),

              ),
              SizedBox(height: 10,),
              Text("Khadija BENJILALI"),
            ],
          )),
          const DrawerItem("/", Icon(Icons.home),"Home"),
          const DrawerItem("/contact", Icon(Icons.person),"Contact"),
          const DrawerItem("/news", Icon(Icons.newspaper),"News"),
          const DrawerItem("/about", Icon(Icons.error),"Contact"),
        ],
      ),
    );
  }

}