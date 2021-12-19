import 'package:flutter/material.dart';
import 'package:flutter_homeworks/homework_2/chat/chat_page.dart';

import 'homework_1/chat/chat_page.dart';
import 'homeworks/homeworks_page.dart';
import 'model/homework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter homeworks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeworksPage(
        title: 'Flutter homeworks',
        items: [
          Homework(title: "Chat (Homework 1)", page: const ChatPage()),
          Homework(title: "Chat (Homework 2)", page: const ChatPage2())
        ]),
    );
  }
}


