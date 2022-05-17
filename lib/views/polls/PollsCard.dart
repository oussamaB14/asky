import 'package:asky/constants/assets.dart';
import 'package:asky/services/PollsService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

import '../../models/Polls.dart';
import '../../styles/colors.dart';
import '../QuestionViews/widgets/Question_Menu.dart';

class PollCard extends StatefulWidget {
  final String id;
  const PollCard({Key? key, required this.poll, required this.id})
      : super(key: key);
  final PollsModel poll;

  @override
  State<PollCard> createState() => _PollCardState();
}

class _PollCardState extends State<PollCard> {
  String? user = FirebaseAuth.instance.currentUser?.uid;
  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.poll.userPhoto),
              ),
              SizedBox(width: 2.h),
              Text(widget.poll.username),
              const Spacer(),
              const QuestionPopMenu(),
            ],
          ),
          Divider(
            height: 1.h,
          ),
          SizedBox(height: 1.5.h),
          Text(widget.poll.question),
          for (int i = 0; i < widget.poll.options.length; i++)
            FutureBuilder<double>(
                future: PollsService()
                    .getOptionPercentage(widget.id, widget.poll.options[i]),
                builder: (context, snapshot) {
                  return TouchableOpacity(
                    child: PoolOption(
                      text: widget.poll.options[i],
                      percentage: snapshot.data ?? 0,
                    ),
                    onTap: () {
                      PollsService()
                          .voteOption(widget.id, widget.poll.options[i]);

                      /*PollsService().getOptionPercentage(
                          widget.id, widget.poll.options[i]);*/
                    },
                  );
                })
        ]),
      ),
    );
  }
}

class PoolOption extends StatelessWidget {
  final String text;
  final double percentage;
  const PoolOption({Key? key, required this.text, required this.percentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LinearPercentIndicator(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          barRadius: const Radius.circular(25),
          lineHeight: 50,
          percent: percentage,
          center: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(
                      color: isDarkTheme
                          ? Colors.white
                          : (percentage * 100).toInt() > 0
                              ? Colors.white
                              : Colors.black),
                ),
                Text(
                  (percentage * 100).toInt().toString() + '%',
                  style: TextStyle(
                      color: (percentage * 100).toInt() > 0
                          ? MyColors.yellow
                          : MyColors.black),
                ),
              ],
            ),
          ),
          // progressColor: isDarkTheme ? MyColors.green : appColor,
          backgroundColor:
              isDarkTheme ? Colors.grey.shade600 : Colors.grey.shade100,
          animation: true,
          animateFromLastPercent: true,
          linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                isDarkTheme ? Colors.green.shade200 : Colors.purple.shade200,
                isDarkTheme ? MyColors.green : appColor
              ]),
        )
      ],
    );
  }
}
