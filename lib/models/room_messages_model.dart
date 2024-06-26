class RoomMessagesModel {
  List<RoomMessageDataModel> messages = [];

  RoomMessagesModel.fromJson(Map<String, dynamic> json){
    json['data'].forEach((element) {
      messages.add(RoomMessageDataModel.fromJson(element));
    });
  }
}


class RoomMessageDataModel {
  final String sender;
  final String receiver;
  final String messageText;

  RoomMessageDataModel({
    required this.sender,
    required this.receiver,
    required this.messageText,
  });

  factory RoomMessageDataModel.fromJson(Map<String, dynamic> json){
    return RoomMessageDataModel(
      sender: json['sender'],
      receiver: json['receiver'],
      messageText: json['text'],
    );
  }
}