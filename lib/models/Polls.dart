import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:asky/models/tags.dart';

class PollsModel {
  String username;
  String userPhoto;
  String question;
  String authorId;
  List<dynamic> options;
  PollsModel({
    required this.username,
    required this.userPhoto,
    required this.question,
    required this.authorId,
    required this.options,
  });
  

  PollsModel copyWith({
    String? username,
    String? userPhoto,
    String? question,
    String? authorId,
    List<dynamic>? options,
  }) {
    return PollsModel(
      username: username ?? this.username,
      userPhoto: userPhoto ?? this.userPhoto,
      question: question ?? this.question,
      authorId: authorId ?? this.authorId,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toDocument() {
    final result = <String, dynamic>{};
  
    result.addAll({'username': username});
    result.addAll({'userPhoto': userPhoto});
    result.addAll({'question': question});
    result.addAll({'authorId': authorId});
    result.addAll({'options': options});
  
    return result;
  }

  factory PollsModel.fromDocument(DocumentSnapshot map) {
    return PollsModel(
      username: map['username'] ?? '',
      userPhoto: map['userPhoto'] ?? '',
      question: map['question'] ?? '',
      authorId: map['authorId'] ?? '',
      options: List<dynamic>.from(map['options']),
    );
  }

  String toJson() => json.encode(toDocument());

  factory PollsModel.fromJson(String source) => PollsModel.fromDocument(json.decode(source));

  @override
  String toString() {
    return 'PollsModel(username: $username, userPhoto: $userPhoto, question: $question, authorId: $authorId, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PollsModel &&
      other.username == username &&
      other.userPhoto == userPhoto &&
      other.question == question &&
      other.authorId == authorId &&
      listEquals(other.options, options);
  }

  @override
  int get hashCode {
    return username.hashCode ^
      userPhoto.hashCode ^
      question.hashCode ^
      authorId.hashCode ^
      options.hashCode;
  }
}
