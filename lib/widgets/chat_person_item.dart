import 'package:flutter/material.dart';
import 'package:graduation_project/views/chat_messages_view.dart';

class ChatPersonItem extends StatelessWidget {
  const ChatPersonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return const ChatMessagesView();
        },
        ),
        );
      },
      child: const Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
                'https://t3.ftcdn.net/jpg/06/92/34/64/240_F_692346400_UzYGmrJm6qhyPPXyZeUGuyEhkwr1iSFN.jpg'),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mohamed Ahmed',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'i want to buy this book can you meet me in fayoum',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
