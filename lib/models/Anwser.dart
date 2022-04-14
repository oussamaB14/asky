import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Anwser {
  String username;
  String awnser;
  String userId;
  String? id;
  Anwser({
    required this.username,
    required this.awnser,
    required this.userId,
    this.id,
  });

  Anwser copyWith({
    String? username,
    String? awnser,
    String? userId,
    String? anwserId,
  }) {
    return Anwser(
      username: username ?? this.username,
      awnser: awnser ?? this.awnser,
      userId: userId ?? this.userId,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toDocument() {
    final result = <String, dynamic>{};
    result.addAll({'username': username});
    result.addAll({'awnser': awnser});
    result.addAll({'userId': userId});

    return result;
  }

  factory Anwser.fromDocument(DocumentSnapshot map) {
    dynamic data = map.data();
    return Anwser(
      id: map.id,
      username: data['username'] ?? '',
      awnser: data['awnser'] ?? '',
      userId: data['userId'] ?? '',
    );
  }

  String toJson() => json.encode(toDocument());

  factory Anwser.fromJson(String source) =>
      Anwser.fromDocument(json.decode(source));

  @override
  String toString() {
    return 'Anwser(username: $username, awnser: $awnser, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Anwser &&
        other.username == username &&
        other.awnser == awnser &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return username.hashCode ^ awnser.hashCode ^ userId.hashCode;
  }
}
