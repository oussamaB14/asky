import 'dart:convert';

class TagModel {
  String id;
  String title;

  TagModel({
    required this.id,
    required this.title,
  });

  TagModel copyWith({
    String? id,
    String? title,
  }) {
    return TagModel(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  final List<TagModel> _tagsToSelect = [
    TagModel(id: '1', title: 'JavaScript'),
    TagModel(id: '2', title: 'Python'),
    TagModel(id: '3', title: 'Java'),
    TagModel(id: '4', title: 'PHP'),
    TagModel(id: '5', title: 'C#'),
    TagModel(id: '6', title: 'C++'),
    TagModel(id: '7', title: 'Dart'),
    TagModel(id: '8', title: 'DataFlex'),
    TagModel(id: '9', title: 'Flutter'),
    TagModel(id: '10', title: 'Flutter Selectable Tags'),
    TagModel(id: '11', title: 'Android Studio developer'),
  ];
}
