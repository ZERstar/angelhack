class ChatBotModel {
  final String text;

  ChatBotModel(this.text);

  factory ChatBotModel.fromJson(Map<String, dynamic> json) {
    return ChatBotModel(
      json['text'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
    };
  }
}
