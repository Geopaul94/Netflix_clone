import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class VideoListItem extends StatelessWidget {
  final int index;

  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
// left side

                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off,
                      size: 30,
                    ),
                  ),
                ),
                // right side
                const Spacer(),
                // Right side
                const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://media.themoviedb.org/t/p/w220_and_h330_face/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg"),
                    ),
                    VideoActionWidgets(
                      icon: Icons.emoji_emotions,
                      titile: 'Lol',
                    ),
                    VideoActionWidgets(
                      icon: Icons.add,
                      titile: 'Lol',
                    ),
                    VideoActionWidgets(
                      icon: Icons.share,
                      titile: 'Lol',
                    ),
                    VideoActionWidgets(
                      icon: Icons.play_arrow,
                      titile: 'Lol',
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionWidgets extends StatelessWidget {
  final String titile;
  final IconData icon;
  const VideoActionWidgets(
      {super.key, required this.titile, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: kwhitecolor,
            size: 30,
          ),
          Text(
            titile,
            style: const TextStyle(),
          )
        ],
      ),
    );
  }
}
