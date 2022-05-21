import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class TagModel {
  final String tag;
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

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'tag': tag});

    return result;
  }

  factory TagModel.fromMap(Map<String, dynamic> map) {
    return TagModel(
      tag: map['tag'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TagModel.fromJson(String source) =>
      TagModel.fromMap(json.decode(source));

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
