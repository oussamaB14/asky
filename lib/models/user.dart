import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UserModel {
  late String email;
  late String name;
  late String photoUrl;
  late String role;
  late String bio;
  late String id;
  late String educationFiled;
  late List mySpaces;
  late List myBookmarks;

  UserModel({
    this.email = '',
    this.name = '',
    this.photoUrl = '',
    this.role = '',
    this.bio = '',
    this.id = '',
    this.educationFiled = '',
    this.mySpaces = const [],
    this.myBookmarks = const [],
  });

//   factory UserModel.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
//   Map<String, dynamic> toJson() => _$SpaceToJson(this);
// }

// UserModel _$UserFromJson(Map<String, dynamic> json) => UserModel(
//       id: json['id'] as String? ?? '',
//       name: json['name'] as String? ?? '',
//       email: json['mail'] as String? ?? '',
//       role: json['role'] as String? ?? '',
//       bio: json['bio'] as String? ?? '',
//       educationFiled: json['educationFiled'] as String? ?? '',
//       photoUrl: json['photoUrl'] as String? ?? 'default.png',
//       mySpaces: (json['mySpaces'] as List<dynamic>?)!.toList(),
//       myBookmarks: (json['myBookmarks'] as List<dynamic>?)!.toList(),
//     );
// Map<String, dynamic> _$SpaceToJson(UserModel instance) => <String, dynamic>{
//       'id': instance.id,
//       'name': instance.name,
//       'role': instance.role,
//       'photoUrl': instance.photoUrl,
//       'bio': instance.bio,
//       'email': instance.email,
//       'myBookmarks': instance.myBookmarks,
//       'mySpaces': instance.mySpaces
//     };

////////// another methde ///////////////
  // UserModel.fromDocument(Map<String, dynamic> json) {
  //   name = json['name'];
  //   email = json['email'];
  //   role = json['role'];
  //   photoUrl = json['photoUrl'];
  //   educationFiled = json['educationFiled'];
  //   bio = json['bio'];
  //   id = json['id'];
  //   mySpaces = json['mySpaces'];
  //   myBookmarks = json['myBookmarks'];
  // }

  // Map<String, dynamic> toDocument() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = name;
  //   data['role'] = role;
  //   data['email'] = email;
  //   data['photoUrl'] = photoUrl;
  //   data['bio'] = bio;
  //   data['educationFiled'] = educationFiled;
  //   data['id'] = id;
  //   data['mySpaces'] = mySpaces;
  //   data['myBookmarks'] = myBookmarks;

  //   return data;
  // }
//////////////////// anpther methode ///////////////////////

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
      email: mail ?? this.email,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      role: role ?? this.role,
      bio: bio ?? this.bio,
      id: id ?? this.id,
      educationFiled: educationFiled ?? this.educationFiled,
    );
  }

  Map<String, dynamic> toDocument() {
    final result = <String, dynamic>{};

    result.addAll({'mail': email});
    result.addAll({'name': name});
    result.addAll({'photoUrl': photoUrl});
    result.addAll({'role': role});
    result.addAll({'bio': bio});
    result.addAll({'id': id});
    result.addAll({'educationFiled': educationFiled});

    return result;
  }

  factory UserModel.fromDocument(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      role: map['role'] ?? '',
      bio: map['bio'] ?? '',
      id: map['id'] ?? '',
      educationFiled: map['educationFiled'] ?? '',
    );
  }

  String toJson() => json.encode(toDocument());

  factory UserModel.fromJson(String source) =>
      UserModel.fromDocument(json.decode(source));

  @override
  String toString() {
    return 'User(mail: $email, name: $name, photoUrl: $photoUrl, role: $role, bio: $bio, id: $id, educationFiled: $educationFiled)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.email == email &&
        other.name == name &&
        other.photoUrl == photoUrl &&
        other.role == role &&
        other.bio == bio &&
        other.id == id &&
        other.educationFiled == educationFiled;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        name.hashCode ^
        photoUrl.hashCode ^
        role.hashCode ^
        bio.hashCode ^
        id.hashCode ^
        educationFiled.hashCode;
  }
}
