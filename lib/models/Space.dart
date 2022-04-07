import 'dart:convert';

class Space {
  String name;
  Space({
    required this.name,
  });

  Space copyWith({
    String? name,
  }) {
    return Space(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
  
    return result;
  }

  factory Space.fromMap(Map<String, dynamic> map) {
    return Space(
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Space.fromJson(String source) => Space.fromMap(json.decode(source));

  @override
  String toString() => 'Space(name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Space &&
      other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
