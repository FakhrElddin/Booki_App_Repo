import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/widgets/chat_person_item.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Chats',
            ),
            const SizedBox(
              height: 16,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => const ChatPersonItem(),
              separatorBuilder: (context, index) => const Divider(
                color: kPrimaryColor,
                height: 48,
                thickness: 1.5,
                endIndent: 16,
                indent: 16,
              ),
              itemCount: 10,
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
