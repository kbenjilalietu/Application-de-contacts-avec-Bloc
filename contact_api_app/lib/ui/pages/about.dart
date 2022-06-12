import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class About extends StatelessWidget {
  String url = "https://api.github.com/users/kbenjilalietu";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("About"),
          ),
          body: const Padding(padding: EdgeInsets.all(0.5),
            child: Expanded(
              child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: "https://github.com/kbenjilalietu?tab=repositories",
              ),
            )));
  }
}
