import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

typedef ItemBuilder<T> = Widget Function(
  BuildContext context,
  DocumentSnapshot doc,
);

class CommentsStreamWrapper extends StatelessWidget {
  final Stream<QuerySnapshot> stream;
  final ItemBuilder<DocumentSnapshot> itemBuilder;
  final Axis scrollDirection;
  final bool shrinkWrap;
  final ScrollPhysics physics;
  final EdgeInsets padding;

  const CommentsStreamWrapper({
    Key? key,
    required this.stream,
    required this.itemBuilder,
    this.scrollDirection = Axis.vertical,
    this.shrinkWrap = false,
    this.physics = const ClampingScrollPhysics(),
    this.padding = const EdgeInsets.only(bottom: 2.0, left: 2.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var list = snapshot.data?.docs.toList();
          return list!.isEmpty
              ? Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text('No comments'),
                    ),
                  ),
                )
              : ListView.builder(
                  reverse: true,
                  padding: padding,
                  scrollDirection: scrollDirection,
                  itemCount: list.length,
                  shrinkWrap: shrinkWrap,
                  physics: physics,
                  itemBuilder: (BuildContext context, int index) {
                    return itemBuilder(context, list[index]);
                  },
                );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}