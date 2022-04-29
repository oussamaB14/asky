import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class TagModel {
  final String id;
  final String tag;

  TagModel({
    this.id = '',
    this.tag = '',
  });

  factory TagModel.fromJson(Map<String, dynamic> json) =>
      _$TagModelFromJson(json);
  Map<String, dynamic> toJson() => _$TagModelToJson(this);
}

TagModel _$TagModelFromJson(Map<String, dynamic> json) => TagModel(
      id: json['id'] as String? ?? '',
      tag: json['tag'] as String? ?? '',
    );

Map<String, dynamic> _$TagModelToJson(TagModel instance) => <String, dynamic>{
      'id': instance.id,
      'tag': instance.tag,
    };
