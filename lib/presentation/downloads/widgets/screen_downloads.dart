import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/widgets/appbar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final List<String> imageList = [
    "https://media.themoviedb.org/t/p/w220_and_h330_face/gxVcBc4VM0kAg9wX4HVg6KJHG46.jpg",
    "https://media.themoviedb.org/t/p/w220_and_h330_face/bXi6IQiQDHD00JFio5ZSZOeRSBh.jpg",
    "https://media.themoviedb.org/t/p/w220_and_h330_face/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppbarWidget(
          title: "Downloads",
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          const smartdownloads(),
          kwidth,
          const Text(
            "Introducing downloads for you",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 23,
              color: kwhitecolor,
              fontWeight: FontWeight.bold,
            ),
          ),
          kheight,
          const Text(
            "We will download a personalized collection of \nmovies and shows for you, so there's \nalways something to watch on your\n device.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: size.width,
            height: size.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(.5),
                    radius: size.width * .4,
                  ),
                ),
                DownloadsImageWidget(
                  imageList: imageList[0],
                  margin: const EdgeInsets.only(left: 180, bottom: 50),
                  size: Size(size.width * .37, size.width * .54),
                  angle: 25,
                ),
                DownloadsImageWidget(
                  imageList: imageList[1],
                  margin: const EdgeInsets.only(right: 180, bottom: 50),
                  size: Size(size.width * .37, size.width * .54),
                  angle: -25,
                ),
                DownloadsImageWidget(
                  imageList: imageList[2],
                  margin: const EdgeInsets.only(top: 17),
                  size: Size(size.width * .43, size.width * .62),
                )
              ],
            ),
          ),
          kwidth,
          Container(
            padding: const EdgeInsets.all(8), // Adjust the margin as needed
            child: MaterialButton(
              height: 40,
              color: kButtonColorBlue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              onPressed: () {},
              child: const Text(
                "Set up",
                style: TextStyle(
                    color: kwhitecolor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: MaterialButton(
              height: 40,
              color: kwhitecolor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              onPressed: () {},
              child: const Text(
                "See What You Can Download",
                style: TextStyle(
                    color: kBlackcolor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class smartdownloads extends StatelessWidget {
  const smartdownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.settings,
          color: kwhitecolor,
        ),
        SizedBox(width: 10),
        Text("Smart Downloads"),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
  });

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageList),
          ),
        ),
      ),
    );
  }
}
