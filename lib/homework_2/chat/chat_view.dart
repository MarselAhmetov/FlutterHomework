import 'package:flutter/material.dart';

class ChatList extends StatefulWidget {
  final String name;
  final String message;

  const ChatList({Key? key, required this.name, required this.message})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.name,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                widget.message,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
