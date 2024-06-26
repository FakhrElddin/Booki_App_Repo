class ConversationsModel{
  List <ConversationsDataModel> data = [];

  ConversationsModel({
    required this.data,
  });

  ConversationsModel.fromJson(Map<String, dynamic> json){
    json['data'].forEach((element){
      data.add(ConversationsDataModel.fromJson(element));
    });
  }
}

class ConversationsDataModel{
  final String id;
  final ConversationsOwner owner;
  final ConversationsBuyer buyer;

  ConversationsDataModel({
    required this.id,
    required this.owner,
    required this.buyer,
  });

  factory ConversationsDataModel.fromJson(Map<String, dynamic> json){
    return ConversationsDataModel(
      id: json['_id'],
      owner: ConversationsOwner.fromJson(json['owner']),
      buyer: ConversationsBuyer.fromJson(json['buyer']),
    );
  }
}

class ConversationsOwner{
  final String id;
  final String name;

  ConversationsOwner({
    required this.id,
    required this.name,
  });

  factory ConversationsOwner.fromJson(Map<String, dynamic> json){
    return ConversationsOwner(
      id: json['_id'],
      name: json['name'],
    );
  }
}

class ConversationsBuyer{
  final String id;
  final String name;

  ConversationsBuyer({
    required this.id,
    required this.name,
  });

  factory ConversationsBuyer.fromJson(Map<String, dynamic> json){
    return ConversationsBuyer(
      id: json['_id'],
      name: json['name'],
    );
  }
}