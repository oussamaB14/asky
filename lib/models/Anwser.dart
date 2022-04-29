import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Anwser {
  late String username;
  late String awnser;
  late String userId;
  late String userImg;
  late String id;
  Anwser({
    required this.username,
    required this.awnser,
    required this.userId,
    required this.userImg,
    required this.id,
  });
  Anwser.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    awnser = json['awnser'];
    userImg = json['userImg'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['awnser'] = username;
    data['comment'] = awnser;
    // data['timestamp'] = this.timestamp;
    data['userDp'] = userImg;
    data['userId'] = userId;
    return data;
  }
}

//   Anwser copyWith({
//     String? username,
//     String? awnser,
//     String? userId,
//     String? userImg,
//   }) {
//     return Anwser(
//       username: username ?? this.username,
//       awnser: awnser ?? this.awnser,
//       userId: userId ?? this.userId,
//       userImg: userImg ?? this.userImg,
//       id: id ?? this.id,
//     );
//   }

//   Map<String, dynamic> toDocument() {
//     final result = <String, dynamic>{};
//     result.addAll({'username': username});
//     result.addAll({'awnser': awnser});
//     result.addAll({'userId': userId});
//     result.addAll({'userImg': userImg});

//     return result;
//   }

//   factory Anwser.fromDocument(DocumentSnapshot map) {
//     dynamic data = map.Questions();
//     return Anwser(
//       id: map.id,
//       username: Questions['username'] ?? '',
//       awnser: Questions['awnser'] ?? '',
//       userId: Questions['userId'] ?? '',
//       userImg: Questions['userImg'] ?? '',
//     );
//   }

//   String toJson() => json.encode(toDocument());

//   factory Anwser.fromJson(String source) =>
//       Anwser.fromDocument(json.decode(source));

//   @override
//   String toString() {
//     return 'Anwser(username: $username, awnser: $awnser, userId: $userId , userImg: $userImg)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is Anwser &&
//         other.username == username &&
//         other.awnser == awnser &&
//         other.userId == userId;
//   }

//   @override
//   int get hashCode {
//     return username.hashCode ^
//         awnser.hashCode ^
//         userId.hashCode ^
//         userImg.hashCode;
//   }
// }
