// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MessageModel {
  String? id;
  String? title;
  String? body;
  String? imageUrl;
  String? type;
  String? token;
  String? topic;
  String? link;

  MessageModel(
      {this.id,
      this.title,
      this.body,
      this.type,
      this.token,
      this.topic,
      this.imageUrl,
      this.link});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id.toString(),
      'title': title.toString(),
      'body': body.toString(),
      'imageUrl': imageUrl.toString(),
      'type': type.toString(),
      'topic': topic.toString(),
      'link': link.toString()
    };
  }

  Map<String, dynamic> toSendMessage() {
    return <String, dynamic>{
      'title': title.toString(),
      'body': body.toString(),
      'token': token.toString(),
      'imageUrl': imageUrl.toString(),
      'link': link.toString(),
      'topic': topic.toString()
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      body: map['body'] != null ? map['body'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      topic: map['topic'] != null ? map['topic'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());
  String toSend() => json.encode(toSendMessage());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
