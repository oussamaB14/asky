import 'dart:convert';

class Space {
  String spaceName;
  String id;
  String spacePhoto;
  String tag;
  Space({
    required this.spaceName,
    required this.id,
    required this.spacePhoto,
    required this.tag,
  });

  Space copyWith({
    String? spaceName,
    String? id,
    String? spacePhoto,
    String? tag,
  }) {
    return Space(
      spaceName: spaceName ?? this.spaceName,
      id: id ?? this.id,
      spacePhoto: spacePhoto ?? this.spacePhoto,
      tag: tag ?? this.tag,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'spaceName': spaceName});
    result.addAll({'id': id});
    result.addAll({'spacePhoto': spacePhoto});
    result.addAll({'tag': tag});
  
    return result;
  }

  factory Space.fromMap(Map<String, dynamic> map) {
    return Space(
      spaceName: map['spaceName'] ?? '',
      id: map['id'] ?? '',
      spacePhoto: map['spacePhoto'] ?? '',
      tag: map['tag'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Space.fromJson(String source) => Space.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Space(spaceName: $spaceName, id: $id, spacePhoto: $spacePhoto, tag: $tag)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Space &&
      other.spaceName == spaceName &&
      other.id == id &&
      other.spacePhoto == spacePhoto &&
      other.tag == tag;
  }

  @override
  int get hashCode {
    return spaceName.hashCode ^
      id.hashCode ^
      spacePhoto.hashCode ^
      tag.hashCode;
  }
}