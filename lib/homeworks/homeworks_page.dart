import 'package:flutter/material.dart';

import '../../model/homework.dart';

class HomeworksPage extends StatelessWidget {
  const HomeworksPage({Key? key,
    required this.title,
    required this.items}) : super(key: key);
  final String title;
  final List<Homework> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: ListView(
        children: items.map((item) {
          return ListTile(
            title: Text(item.title),
            onTap: () {
              navigateTo(context, item.page);
            },
          );
        }).toList(),
      )),
    );
  }

  void navigateTo(context, page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }
}
