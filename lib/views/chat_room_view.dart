import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/cubits/app_cubit/app_cubit.dart';

class ChatRoomView extends StatefulWidget {
  const ChatRoomView({super.key, required this.name, required this.conversationId});

  final String name;
  final String conversationId;

  @override
  State<ChatRoomView> createState() => _ChatRoomViewState();
}

class _ChatRoomViewState extends State<ChatRoomView> {

  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var appCubit = BlocProvider.of<AppCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: ConditionalBuilder(
        condition: appCubit.messages.isNotEmpty,
        builder: (context) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index){
                    if(userId == appCubit.messages[index].sender){
                      return MyMessage(message: appCubit.messages[index].messageText,);
                    } else{
                      return Message(message: appCubit.messages[index].messageText,);
                    }
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 10,),
                  itemCount: appCubit.messages.length,
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsetsDirectional.only(start: 8),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: messageController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'Write your message here',
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      color: kPrimaryColor,
                      child: MaterialButton(
                        minWidth: 1,
                        onPressed: () {
                          appCubit.createMessage(
                            conversationId: widget.conversationId,
                            message: messageController.text,
                          );
                          appCubit.getMessagesOfSpecificConversation(conversationId: widget.conversationId);
                          messageController.text = '';
                        },
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        fallback: (context) => Center(child: CircularProgressIndicator()),
      ),
      // body: Column(
      //   children: [
      //     Container(
      //       //width: MediaQuery.of(context).size.width/2,
      //       decoration: BoxDecoration(
      //         color: Colors.grey[300],
      //         borderRadius: BorderRadiusDirectional.only(
      //           topStart: Radius.circular(10),
      //           topEnd: Radius.circular(10),
      //           bottomEnd: Radius.circular(10),
      //         ),
      //       ),
      //       padding: EdgeInsetsDirectional.symmetric(
      //         horizontal: 12,
      //         vertical: 8,
      //       ),
      //       child: Text(
      //         'i want to buy book',
      //         style: TextStyle(
      //             fontSize: 16,
      //             fontWeight: FontWeight.normal
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  },
);
  }
}


class Message extends StatelessWidget {
  const Message({
    super.key, required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        //width: MediaQuery.of(context).size.width/2,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(10),
            topEnd: Radius.circular(10),
            bottomEnd: Radius.circular(10),
          ),
        ),
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        child: Text(
          message,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal
          ),
        ),
      ),
    );
  }
}

class MyMessage extends StatelessWidget {
  const MyMessage({
    super.key, required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        //width: MediaQuery.of(context).size.width/2,
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.5),
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(10),
            topEnd: Radius.circular(10),
            bottomStart: Radius.circular(10),
          ),
        ),
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        child: Text(
          message,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal
          ),
        ),
      ),
    );
  }
}
