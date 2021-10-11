import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class WebSockets extends StatefulWidget {
  WebSockets({Key key}) : super(key: key);

  @override
  _WebSocketsState createState() => _WebSocketsState();
}

class _WebSocketsState extends State<WebSockets> {
  final channel = IOWebSocketChannel.connect('ws://echo.websocket.org');
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: TextFormField(
                controller: editingController,
                decoration: InputDecoration(labelText: 'Message'),
              ),
            ),
          ),
          StreamBuilder(
            stream: channel.stream,
            builder: (context, snapshot) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  snapshot.hasData ? '${snapshot.data}' : '',
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          ),
          RaisedButton(
            color: Colors.lime,
            child: Text('Send Message'),
            onPressed: showWebData,
          )
        ],
      ),
    );
  }

  showWebData() {
    if (editingController.text.isNotEmpty) {
      channel.sink.add(editingController.text);
    }
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}
