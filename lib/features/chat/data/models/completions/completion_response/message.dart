class Message {
  String? content;
  dynamic refusal;
  String? role;

  Message({this.content, this.refusal, this.role});

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        content: json['content'] as String?,
        refusal: json['refusal'] as dynamic,
        role: json['role'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'content': content,
        'refusal': refusal,
        'role': role,
      };
}
