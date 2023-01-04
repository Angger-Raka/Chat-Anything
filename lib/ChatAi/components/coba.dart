import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InputChat extends StatefulWidget {
  const InputChat({Key? key}) : super(key: key);

  @override
  State<InputChat> createState() => _InputChatState();
}

class _InputChatState extends State<InputChat> {
  final messageController = TextEditingController();

  final api = ChatGPT.instance;

  Future<String> getImageUrl(String prompt) async {
    String url = 'https://api.openai.com/v1/images/generations';
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer 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',
    };
    String json = '{"prompt": "$prompt", "n": 2, "size": "1024x1024"}';

    http.Response response =
        await http.post(Uri.parse(url), headers: headers, body: json);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseJson = jsonDecode(response.body);
      return responseJson['data'][0]['url'];
    } else {
      throw Exception('Failed to get image URL');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    right: BorderSide(width: 2, color: Colors.transparent))),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(CupertinoIcons.paperclip),
            ),
          ),
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: const InputDecoration(
                hintText: 'Klik untuk message',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 24,
            ),
            child: IconButton(
              color: Colors.orange,
              icon: Icon(Icons.send),
              onPressed: () async {
                if (messageController.text.isNotEmpty) {
                  await getImageUrl(messageController.text).then((value) => {
                        print(value),
                      });
                  messageController.clear();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
