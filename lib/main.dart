import 'package:chat_anything/ImageGenerator/image_screen.dart';
import 'package:flutter/material.dart';

import 'chat/chat_screen.dart';
import 'chat/components/chat_input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: const Text('Tabs Demo'),
          ),
          body: const TabBarView(
            children: [
              ChatScreen(),
              InputChat(),
              ImageScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
