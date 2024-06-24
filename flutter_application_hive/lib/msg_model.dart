// To parse this JSON data, do
//
//     final msgModel = msgModelFromJson(jsonString);

import 'dart:convert';

MsgModel msgModelFromJson(String str) => MsgModel.fromJson(json.decode(str));

String msgModelToJson(MsgModel data) => json.encode(data.toJson());

class MsgModel {
  String? messageId;
  Receiver? sender;
  Receiver? receiver;
  String? content;
  DateTime? timestamp;
  String? type;
  String? status;
  bool? read;

  MsgModel({
    this.messageId,
    this.sender,
    this.receiver,
    this.content,
    this.timestamp,
    this.type,
    this.status,
    this.read,
  });

  factory MsgModel.fromJson(Map<String, dynamic> json) => MsgModel(
        messageId: json["message_id"],
        sender:
            json["sender"] == null ? null : Receiver.fromJson(json["sender"]),
        receiver: json["receiver"] == null
            ? null
            : Receiver.fromJson(json["receiver"]),
        content: json["content"],
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
        type: json["type"],
        status: json["status"],
        read: json["read"],
      );

  Map<String, dynamic> toJson() => {
        "message_id": messageId,
        "sender": sender?.toJson(),
        "receiver": receiver?.toJson(),
        "content": content,
        "timestamp": timestamp?.toIso8601String(),
        "type": type,
        "status": status,
        "read": read,
      };
}

class Receiver {
  String? userId;
  String? username;
  String? avatarUrl;

  Receiver({
    this.userId,
    this.username,
    this.avatarUrl,
  });

  factory Receiver.fromJson(Map<String, dynamic> json) => Receiver(
        userId: json["user_id"],
        username: json["username"],
        avatarUrl: json["avatar_url"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "username": username,
        "avatar_url": avatarUrl,
      };
}
