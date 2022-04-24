import 'dart:convert';

import 'package:asky/models/tags.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  String username;
  String? id;
  String title;
  String content;
  String authorId;
  List<TagModel> tags; 
  Question({
    required this.username,
    required this.title,
    required this.content,
    required this.authorId,
    this.id,
    this.tags = const [],
  });

  Question copyWith({
    String? username,
    String? title,
    String? content,
    String? authorId,
    String? id,
    List? tags,
  }) {
    return Question(
      username: username ?? this.username,
      title: title ?? this.title,
      content: content ?? this.content,
      authorId: authorId ?? this.authorId,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toDocument() {
    final result = <String, dynamic>{};
    result.addAll({'username': username});
    result.addAll({'title': title});
    result.addAll({'content': content});
    result.addAll({'authorId': authorId});
    result.addAll({'tags': tags});

    return result;
  }

  factory Question.fromDocument(DocumentSnapshot map) {
    dynamic data = map.data();
    return Question(
      id: map.id,
      username: data['username'] ?? '',
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      authorId: data['authorId'] ?? '',
    );
  }

  String toJson() => json.encode(toDocument());

  factory Question.fromJson(String source) =>
      Question.fromDocument(json.decode(source));

  @override
  String toString() =>
      'Question(username:$username, title: $title, content: $content, authorId: $authorId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Question &&
        other.username == username &&
        other.title == title &&
        other.content == content &&
        other.authorId == authorId;
  }

  @override
  int get hashCode =>
      username.hashCode ^ title.hashCode ^ content.hashCode ^ authorId.hashCode;
}
