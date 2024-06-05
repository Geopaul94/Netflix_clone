import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/application/model/popular.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/search/serchtitle.dart';

class SearchIdle_Widget extends StatelessWidget {
  const SearchIdle_Widget({super.key, required List<Popular> popular});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Top Searchs'),
        kheight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => TopsearchItemtile(),
              separatorBuilder: (context, index) => kheight,
              itemCount: 10),
        )
      ],
    );
  }
}

class TopsearchItemtile extends StatelessWidget {
  TopsearchItemtile({super.key});
  final imageUrl =
      "https://media.themoviedb.org/t/p/w250_and_h141_face/9wJO4MBzkqgUZemLTGEsgUbYyP6.jpg";

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(
          width: screenwidth * 0.4,
          height: 80,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) {
              return const Center(child: CircularProgressIndicator());
            },
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 8),
        const Expanded(
          child: Text(
            "Movie Title",
            style: TextStyle(
                color: kwhitecolor, fontSize: 16, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const CircleAvatar(
          backgroundColor: kwhitecolor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: kBlackcolor,
            radius: 23,
            child: Icon(
              CupertinoIcons.play_fill,
              color: kwhitecolor,
            ),
          ),
        )
      ],
    );
  }
}

