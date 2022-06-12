
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainerNews extends StatelessWidget{
  String title;
  final url;
  WebViewContainerNews(this.title,this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 17),),),
      body: Column(
        children: [
          Expanded(
            child: WebView(
              key : UniqueKey(),
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: url,
            ),
          )
        ],
      ),
    );
  }

}