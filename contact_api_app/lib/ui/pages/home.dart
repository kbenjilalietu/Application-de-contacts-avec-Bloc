import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../drawer/app_drawer.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      drawer: AppDrawer(),
      body: Center(
        child: Text("Bienvenue", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.brown, fontFamily: "monospace"),),
      ),
    );
  }

}