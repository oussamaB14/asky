import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class TagModel {
  String tag;
  TagModel({
    required this.tag,
  });

  TagModel copyWith({
    String? tag,
  }) {
    return TagModel(
      tag: tag ?? this.tag,
    );
  }

  Map<String, dynamic> toDocument() {
    final result = <String, dynamic>{};

    result.addAll({'tag': tag});

    return result;
  }

  factory TagModel.fromDocument(DocumentSnapshot doc) {
    return TagModel(
      tag: doc['tag'] ?? '',
    );
  }

  String toJson() => json.encode(toDocument());

  factory TagModel.fromJson(String source) =>
      TagModel.fromDocument(json.decode(source));

  @override
  String toString() => 'TagModel(tag: $tag)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TagModel && other.tag == tag;
  }

  @override
  int get hashCode => tag.hashCode;
}
