import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:asky/models/tags.dart';

class Polls {
  String username;
  String userPhoto;
  String id;
  String question;
  String content;
  String authorId;
  List<TagModel> tags;
  List<String> options;
  Polls({
    required this.username,
    required this.userPhoto,
    required this.id,
    required this.question,
    required this.content,
    required this.authorId,
    required this.tags,
    required this.options,
  });

  Polls copyWith({
    String? username,
    String? userPhoto,
    String? id,
    String? question,
    String? content,
    String? authorId,
    List<TagModel>? tags,
    List<String>? options,
  }) {
    return Polls(
      username: username ?? this.username,
      userPhoto: userPhoto ?? this.userPhoto,
      id: id ?? this.id,
      question: question ?? this.question,
      content: content ?? this.content,
      authorId: authorId ?? this.authorId,
      tags: tags ?? this.tags,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toDocument() {
    final result = <String, dynamic>{};

    result.addAll({'username': username});
    result.addAll({'userPhoto': userPhoto});
    result.addAll({'id': id});
    result.addAll({'question': question});
    result.addAll({'content': content});
    result.addAll({'authorId': authorId});
    result.addAll({'tags': tags.map((x) => x.toMap()).toList()});
    result.addAll({'options': options});

    return result;
  }

  factory Polls.fromDocument(DocumentSnapshot map) {
    return Polls(
      username: map['username'] ?? '',
      userPhoto: map['userPhoto'] ?? '',
      id: map['id'] ?? '',
      question: map['question'] ?? '',
      content: map['content'] ?? '',
      authorId: map['authorId'] ?? '',
      tags: List<TagModel>.from(map['tags']?.map((x) => TagModel.fromMap(x))),
      options: List<String>.from(map['options']),
    );
  }

  String toJson() => json.encode(toDocument());

  factory Polls.fromJson(String source) =>
      Polls.fromDocument(json.decode(source));

  @override
  String toString() {
    return 'Polls(username: $username, userPhoto: $userPhoto, id: $id, question: $question, content: $content, authorId: $authorId, tags: $tags, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Polls &&
        other.username == username &&
        other.userPhoto == userPhoto &&
        other.id == id &&
        other.question == question &&
        other.content == content &&
        other.authorId == authorId &&
        listEquals(other.tags, tags) &&
        listEquals(other.options, options);
  }

  @override
  int get hashCode {
    return username.hashCode ^
        userPhoto.hashCode ^
        id.hashCode ^
        question.hashCode ^
        content.hashCode ^
        authorId.hashCode ^
        tags.hashCode ^
        options.hashCode;
  }
}
