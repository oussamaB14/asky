import 'dart:convert';

import 'package:asky/models/Anwser.dart';
import 'package:asky/models/tags.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  String username;
  String userPhoto;
  String id;
  String title;
  String content;
  String authorId;
  String mediaUrl;
  List<TagModel> tags;
  List<Anwser> anwsers;
  Question({
    required this.username,
    required this.userPhoto,
    required this.title,
    required this.content,
    required this.authorId,
    required this.id,
    this.tags = const [],
    this.anwsers = const [],
    required this.mediaUrl,
  });

  Question copyWith({
    String? username,
    String? userPhoto,
    String? title,
    String? content,
    String? authorId,
    String? id,
    String? mediaUrl,
    List? tags,
    List? anwsers,
  }) {
    return Question(
      username: username ?? this.username,
      userPhoto: userPhoto ?? this.userPhoto,
      title: title ?? this.title,
      content: content ?? this.content,
      authorId: authorId ?? this.authorId,
      id: id ?? this.id,
      mediaUrl: mediaUrl ?? this.mediaUrl,
    );
  }

  Map<String, dynamic> toDocument() {
    final result = <String, dynamic>{};
    result.addAll({'username': username});
    result.addAll({'userPhoto': userPhoto});
    result.addAll({'title': title});
    result.addAll({'content': content});
    result.addAll({'authorId': authorId});
    result.addAll({'tags': tags});
    result.addAll({'mediaUrl': mediaUrl});
    result.addAll({'anwsers': anwsers});

    return result;
  }

  factory Question.fromDocument(DocumentSnapshot map) {
    dynamic data = map.data();
    return Question(
      id: map.id,
      username: data['username'] ?? '',
      userPhoto: data['userPhoto'] ?? '',
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      authorId: data['authorId'] ?? '',
      mediaUrl: data['mediaUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toDocument());

  factory Question.fromJson(String source) =>
      Question.fromDocument(json.decode(source));

  @override
  String toString() =>
      'Question(username:$username, userPhoto:$userPhoto, title: $title, content: $content, authorId: $authorId, mediaUrl: $mediaUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Question &&
        other.username == username &&
        other.userPhoto == userPhoto &&
        other.title == title &&
        other.content == content &&
        other.authorId == authorId;
  }

  @override
  int get hashCode =>
      username.hashCode ^
      userPhoto.hashCode ^
      title.hashCode ^
      content.hashCode ^
      authorId.hashCode ^
      mediaUrl.hashCode;
}
