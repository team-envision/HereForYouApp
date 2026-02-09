
class MessageModel {
  final String messageType;
  final String text;
  final Map<String, dynamic> customProperties;

  MessageModel({
    required this.messageType,
    required this.text,
    required this.customProperties,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      messageType: json["type"],
      text: json["text"],
      customProperties: json["customProperties"]??{},
    );
  }
}
