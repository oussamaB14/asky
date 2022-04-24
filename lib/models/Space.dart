import 'dart:convert';

import 'package:asky/models/tags.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Space {
  String spaceName;
  String spacePhoto;
  List<TagModel> tags;
  // List<ChatModel> messages;
  Space({
    required this.spaceName,
    required this.spacePhoto,
    this.tags = const [],
    // this.messages = const [],
  });

  Space copyWith({
    String? spaceName,
    String? id,
    String? spacePhoto,
    String? tag,
    // List<ChatModel>? messages,
  }) {
    return Space(
      spaceName: spaceName ?? this.spaceName,
      spacePhoto: spacePhoto ?? this.spacePhoto,
      tags: tags,
      // messages: messages ?? this.messages,
    );
  }

  Map<String, dynamic> toDocument() {
    final result = <String, dynamic>{};

    result.addAll({'spaceName': spaceName});
    result.addAll({'spacePhoto': spacePhoto});
    result.addAll({'tag': tags});
    // result.addAll({'messages': messages.map((x) => x.toMap()).toList()});

    return result;
  }

  factory Space.fromDocument(DocumentSnapshot map) {
    dynamic data = map.data();
    return Space(
        spaceName: map['spaceName'] ?? '',
        spacePhoto: map['spacePhoto'] ?? '',
        tags: map['tag'] ?? '');
    //   messages: List<ChatModel>.from(
    //       map['messages']?.map((x) => ChatModel.fromMap(x))),
    // );
  }
  // final _db = FirebaseFirestore.instance;

  // Stream<List<Space>> spaceStream() {
  //   try {
  //     return _db.collection("space").snapshots.fromDocument((space) {
  //       final List<Space> spacesFromFirestore = <Space>[];
  //       for (final DocumentSnapshot<Map<String, dynamic>> doc in space.docs) {
  //         spacesFromFirestore.add(Space.fromDocument(Map < String, dynamic > map));
  //       }
  //       return spacesFromFirestore;
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  String toJson() => json.encode(toDocument());

  factory Space.fromJson(String source) =>
      Space.fromDocument(json.decode(source));

  @override
  String toString() {
    return 'Space(spaceName: $spaceName, spacePhoto: $spacePhoto, tag: $tags,)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Space &&
        other.spaceName == spaceName &&
        other.spacePhoto == spacePhoto &&
        other.tags == tags;
    // listEquals(other.messages, messages);
  }

  @override
  int get hashCode {
    return spaceName.hashCode ^ spacePhoto.hashCode ^ tags.hashCode;
    // messages.hashCode;
  }
}
// List<Space> mySpaces =  [(spaceName:'developpment')];

class ChatModel {
  String user;
  String message;
  ChatModel({
    required this.user,
    required this.message,
  });

  ChatModel copyWith({
    String? user,
    String? message,
  }) {
    return ChatModel(
      user: user ?? this.user,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'user': user});
    result.addAll({'message': message});

    return result;
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      user: map['user'] ?? '',
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source));

  @override
  String toString() => 'ChatModel(user: $user, message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatModel && other.user == user && other.message == message;
  }

  @override
  int get hashCode => user.hashCode ^ message.hashCode;
}
