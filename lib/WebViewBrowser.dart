import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewWid extends StatefulWidget {
  WebViewWid({Key key}) : super(key: key);

  @override
  _WebViewWidState createState() => _WebViewWidState();
}

class _WebViewWidState extends State<WebViewWid> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://www.google.com',
      withZoom: true,
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          autofocus: false,
          cursorColor: Colors.amber,
          cursorWidth: 1.4,
          //textInputAction: TextInputAction.go,
          decoration: InputDecoration(
              hintText: 'Enter url here',
              hintStyle: TextStyle(color: Colors.amber),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
