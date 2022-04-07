import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  // String username;
  String? id;
  String title;
  String content;
  String authorId;
  Question(
      {
        // required this.username,
        required this.title,
      required this.content,
      required this.authorId,
      this.id});

  Question copyWith({
    String? title,
    String? content,
    String? authorId,
    String? id,
  }) {
    return Question(
      // username: username ?? this.username,
      title: title ?? this.title,
      content: content ?? this.content,
      authorId: authorId ?? this.authorId,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toDocument() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'content': content});
    result.addAll({'authorId': authorId});

    return result;
  }

  factory Question.fromDocument(DocumentSnapshot doc) {
    dynamic data = doc.data();
    return Question(
      id: doc.id,
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
      'Question(title: $title, content: $content, authorId: $authorId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Question &&
        other.title == title &&
        other.content == content &&
        other.authorId == authorId;
  }

  @override
  int get hashCode => title.hashCode ^ content.hashCode ^ authorId.hashCode;
}
