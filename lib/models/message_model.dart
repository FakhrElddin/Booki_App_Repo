class MessageModel {
  List<MessageDataModel> messages = [];

  MessageModel.fromJson(Map<String, dynamic> json){
    json['data'].forEach((element){
      messages.add(MessageDataModel.fromJson(element));
    });
  }
}

class MessageDataModel {
  final String sender;
  final String receiver;
  final String messageText;

  MessageDataModel({
    required this.sender,
    required this.receiver,
    required this.messageText,
  });

  factory MessageDataModel.fromJson(Map<String, dynamic> json){
    return MessageDataModel(
      sender: json['sender'],
      receiver: json['receiver'],
      messageText: json['text'],
    );
  }
}