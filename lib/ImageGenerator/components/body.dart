import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:chat_anything/models/ImageGeneratorGPT.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  String? prompt;
  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              imageUrl == null
                  ? Container(
                      width: 350,
                      height: 350,
                      color: Colors.red,
                      child: Center(
                        child: Text('No Image',
                            style:
                                TextStyle(fontSize: 30, color: Colors.white)),
                      ),
                    )
                  : Image.network(imageUrl!,
                      width: 350, height: 350, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a prompt';
                    }
                    return null;
                  },
                  onSaved: (value) => prompt = value!,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Make Image anything with text',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  //download image
                },
                child: Text('Download Image'),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    await getImageUrl(prompt!).then((value) => setState(() {
                          imageUrl = value;
                        }));
                    //remove text from textfield
                    _formKey.currentState!.reset();
                  }
                },
                child: Text('Generate Image'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
