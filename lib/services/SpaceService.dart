import 'dart:convert';

class Space {
  String name;
  String id;
  String photo;
  String tag;
  Space({
    required this.name,
    required this.id,
    required this.photo,
    required this.tag,
  });
  

  Space copyWith({
    String? name,
    String? id,
    String? photo,
    String? tag,
  }) {
    return Space(
      name: name ?? this.name,
      id: id ?? this.id,
      photo: photo ?? this.photo,
      tag: tag ?? this.tag,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'id': id});
    result.addAll({'photo': photo});
    result.addAll({'tag': tag});
  
    return result;
  }

  factory Space.fromMap(Map<String, dynamic> map) {
    return Space(
      name: map['name'] ?? '',
      id: map['id'] ?? '',
      photo: map['photo'] ?? '',
      tag: map['tag'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Space.fromJson(String source) => Space.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Space(name: $name, id: $id, photo: $photo, tag: $tag)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Space &&
      other.name == name &&
      other.id == id &&
      other.photo == photo &&
      other.tag == tag;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      id.hashCode ^
      photo.hashCode ^
      tag.hashCode;
  }
}
