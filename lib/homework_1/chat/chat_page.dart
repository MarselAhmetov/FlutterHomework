import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  final String title = "Chat";

  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  final List<String> messages = ['Hello!', 'How are you?'];
  final messageController = TextEditingController();

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: messages.map((message) {
                return ListTile(
                  title: Text(message),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                  labelText: "Type your message",
                  suffixIcon: IconButton (
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      addMessage(messageController.text);
                    },
                  ),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
        ],
      ),
    );
  }

  void addMessage(text) {
    setState(() {
      messages.add(text);
      messageController.clear();
    });
  }
}
