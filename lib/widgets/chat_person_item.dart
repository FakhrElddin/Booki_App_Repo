import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/cubits/app_cubit/app_cubit.dart';
import 'package:graduation_project/models/conversations_model.dart';
import 'package:graduation_project/views/chat_room_view.dart';

class ChatPersonItem extends StatelessWidget {
  const ChatPersonItem({super.key, required this.conversationsDataModel});

  final ConversationsDataModel conversationsDataModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        BlocProvider.of<AppCubit>(context).getMessagesOfSpecificConversation(conversationId: conversationsDataModel.id);
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ChatRoomView(
            name: conversationsDataModel.owner.name,
            conversationId: conversationsDataModel.id,
          );
        },
        ),
        );
      },
      child: Row(
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
                  conversationsDataModel.owner.name,
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
