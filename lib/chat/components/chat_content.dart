import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/component_chat.dart';

class DemoMessageList extends StatefulWidget {
  const DemoMessageList({Key? key}) : super(key: key);
  @override
  _DemoMessageListState createState() => _DemoMessageListState();
}

class _DemoMessageListState extends State<DemoMessageList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return MessageTile(
          message: 'Hello World',
          messageDate: "senin",
        );
      },
    );
  }
}
