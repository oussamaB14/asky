import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      Text(
        'hello dear',
        style: Theme.of(context).textTheme.headline6,
      ),
      Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://dm0qx8t0i9gc9.cloudfront.net/thumbnails/video/Vd3bj2jPe/videoblocks-closeup-excited-male-person-saying-wow-on-black-background-portrait-of-african-american-man-looking-at-camera-in-studio-emotional-afro-guy-posing-indoors_bbmtozmuv_thumbnail-1080_01.png'),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Oussama',
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            ),
          ),
        ),
      )
    ]));
  }
}
