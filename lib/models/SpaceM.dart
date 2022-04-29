import 'package:asky/models/tags.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Space {
  final String id;
  final String spaceName;
  final String description;
  final String spacePhoto;
  final List<TagModel> tags;

  Space({
    this.id = '',
    this.spaceName = '',
    this.description = '',
    this.spacePhoto = 'default.png',
    this.tags = const [],
  });

  factory Space.fromJson(Map<String, dynamic> json) => _$SpaceFromJson(json);
  Map<String, dynamic> toJson() => _$SpaceToJson(this);
}

Space _$SpaceFromJson(Map<String, dynamic> json) => Space(
      id: json['id'] as String? ?? '',
      spaceName: json['spaceName'] as String? ?? '',
      description: json['description'] as String? ?? '',
      spacePhoto: json['spacePhoto'] as String? ?? 'default.png',
      tags: (json['quizzes'] as List<dynamic>?)
              ?.map((e) => TagModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SpaceToJson(Space instance) => <String, dynamic>{
      'id': instance.id,
      'spaceName': instance.spaceName,
      'description': instance.description,
      'spacePhoto': instance.spacePhoto,
      'quizzes': instance.tags,
    };
