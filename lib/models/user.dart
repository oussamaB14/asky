import 'dart:convert';

class UserModel {
  String mail;
  String name;
  String photoUrl;
  String role;
  String bio;
  String id;
  String educationFiled;
  UserModel({
    required this.mail,
    required this.name,
    required this.photoUrl,
    required this.role,
    required this.bio,
    required this.id,
    required this.educationFiled,
  });

  UserModel copyWith({
    String? mail,
    String? name,
    String? photoUrl,
    String? role,
    String? bio,
    String? id,
    String? educationFiled,
  }) {
    return UserModel(
      mail: mail ?? this.mail,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      role: role ?? this.role,
      bio: bio ?? this.bio,
      id: id ?? this.id,
      educationFiled: educationFiled ?? this.educationFiled,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'mail': mail});
    result.addAll({'name': name});
    result.addAll({'photoUrl': photoUrl});
    result.addAll({'role': role});
    result.addAll({'bio': bio});
    result.addAll({'id': id});
    result.addAll({'educationFiled': educationFiled});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      mail: map['mail'] ?? '',
      name: map['name'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      role: map['role'] ?? '',
      bio: map['bio'] ?? '',
      id: map['id'] ?? '',
      educationFiled: map['educationFiled'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(mail: $mail, name: $name, photoUrl: $photoUrl, role: $role, bio: $bio, id: $id, educationFiled: $educationFiled)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.mail == mail &&
        other.name == name &&
        other.photoUrl == photoUrl &&
        other.role == role &&
        other.bio == bio &&
        other.id == id &&
        other.educationFiled == educationFiled;
  }

  @override
  int get hashCode {
    return mail.hashCode ^
        name.hashCode ^
        photoUrl.hashCode ^
        role.hashCode ^
        bio.hashCode ^
        id.hashCode ^
        educationFiled.hashCode;
  }
}