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
  final _formKey = GlobalKey<FormState>();
  String? prompt;
  String? imageUrl;

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

  void _fetchImageUrl() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      String imageUrl = await getImageUrl(prompt!);
      setState(() {
        imageUrl = imageUrl;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a prompt';
                  }
                  return null;
                },
                onSaved: (value) => prompt = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  child: Text('Fetch Image'),
                  onPressed: () async {
                    await getImageUrl(prompt!).then((value) => {
                          imageUrl = value,
                        });
                  }),
              ElevatedButton(
                child: Text('Chat'),
                onPressed: () async {
                  await getImageUrl("gambar manusia").then((value) => {
                        print(value),
                        imageUrl = value,
                      });
                },
              ),
              SizedBox(height: 20),
              imageUrl == null
                  ? Text('No image')
                  : imageUrl == " "
                      ? Text('No image')
                      : Image.network(imageUrl!),
            ],
          ),
        ),
      ),
    );
  }
}
