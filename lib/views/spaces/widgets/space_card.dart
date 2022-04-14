import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SpaceCard extends StatefulWidget {
  const SpaceCard({Key? key}) : super(key: key);

  @override
  State<SpaceCard> createState() => _SpaceCardState();
}

class _SpaceCardState extends State<SpaceCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: EdgeInsets.all(10),
      shape: 
      RoundedRectangleBorder(
        side:  BorderSide(color: Colors.blue, width: 20.h),
        borderRadius: BorderRadius.circular(20),
      ),
      
      child: Container(
        padding: EdgeInsets.all(6),
        height: 16.5.h,
        child: Column(
          children: [
            CircleAvatar(
              radius: 2.7.h,
            ),
            SizedBox(height: 1.h),
            Text("space name "),
            SizedBox(height: 1.h),
            TextButton(
                onPressed: () {},
                style: ButtonStyle(),
                child: Text(
                  "join",
                  style: TextStyle(fontSize: 1.5.h),
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      ),
    );
  }
}
