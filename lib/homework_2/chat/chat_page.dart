import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'chat_store.dart';
import 'chat_view.dart';

class ChatPage2 extends StatefulWidget {
  const ChatPage2({Key? key}) : super(key: key);

  final String title = "Chat 2";

  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage2> {
  final ChatStore _chatStore = ChatStore();

  final messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _chatStore.fetchChat();
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Observer(
            builder: (context) {
              return ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: _chatStore.chat.map((message) {
                  return ChatList(
                    name: message.author,
                    message: message.message,
                  );
                }).toList(),
              );
            },
          )),
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
      _chatStore.sendMessage(messageController.text,
          onSend: () => {messageController.clear()});
    });
  }
}
