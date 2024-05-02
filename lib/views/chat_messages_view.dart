import 'package:flutter/material.dart';

class ChatMessagesView extends StatelessWidget {
  const ChatMessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Chat Messages Screen',
            ),
          ],
        ),
      ),
    );
  }
}
