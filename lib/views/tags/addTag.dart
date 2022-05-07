import 'package:asky/models/tags.dart';
import 'package:asky/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

class AddTag extends StatefulWidget {
  const AddTag({Key? key}) : super(key: key);

  @override
  State<AddTag> createState() => _AddTagState();
}

class _AddTagState extends State<AddTag> {
  late double _distanceToField;
  late TextfieldTagsController _controller;
  List<TagModel> questionTags = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = TextfieldTagsController();
  }

  static const List<String> _pickLanguage = <String>[
    'c',
    'c++',
    'java',
    'python',
    'javascript',
    'php',
    'sql',
    'yaml',
    'gradle',
    'xml',
    'html',
    'flutter',
    'css',
    'dockerfile'
  ];
  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsViewBuilder: (context, onSelected, options) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Material(
              elevation: 4.0,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 200),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final dynamic option = options.elementAt(index);
                    return TextButton(
                      onPressed: () {
                        onSelected(option);
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Text(
                            '#$option',
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _pickLanguage.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selectedTag) {
        _controller.addTag = selectedTag;
      },
      fieldViewBuilder: (context, ttec, tfn, onFieldSubmitted) {
        return TextFieldTags(
          textEditingController: ttec,
          focusNode: tfn,
          textfieldTagsController: _controller,
          initialTags: const ['programming', 'web development'],
          textSeparators: const [' ', ','],
          letterCase: LetterCase.normal,
          validator: (String tag) {
            if (tag == '') {
              return 'no empty tags';
            } else if (_controller.getTags!.contains(tag)) {
              return 'you already entered that';
            }
            return null;
          },
          inputfieldBuilder: (context, tec, fn, error, onChanged, onSubmitted) {
            return ((context, sc, tags, onTagDelete) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: TextField(
                  autofocus: true,
                  // scrollPadding: EdgeInsets.only(left: 2),
                  controller: tec,
                  focusNode: fn,
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 3.0),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 3.0),
                    ),
                    helperText: "you can add tags to your Question",
                    helperStyle: const TextStyle(
                      color: Colors.blue,
                    ),
                    hintText: _controller.hasTags ? '' : "Tag..",
                    errorText: error,
                    prefixIconConstraints:
                        BoxConstraints(maxWidth: _distanceToField * 1),
                    prefixIcon: tags.isNotEmpty
                        ? SingleChildScrollView(
                            controller: sc,
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                children: tags.map((String tag) {
                              return Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  color: Colors.blue,
                                ),
                                margin: const EdgeInsets.only(right: 10.0),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      child: Text(
                                        '#$tag',
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      onTap: () {
                                        print("$tag selected");
                                      },
                                    ),
                                    const SizedBox(width: 4.0),
                                    InkWell(
                                      child: const Icon(
                                        Icons.cancel,
                                        size: 14.0,
                                        color:
                                            Color.fromARGB(255, 233, 233, 233),
                                      ),
                                      onTap: () {
                                        onTagDelete(tag);
                                      },
                                    )
                                  ],
                                ),
                              );
                            }).toList()),
                          )
                        : null,
                  ),
                  onChanged: onChanged,
                  onSubmitted: onSubmitted,
                ),
              );
            });
          },
        );
      },
    );
  }
}
