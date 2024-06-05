import 'package:flutter/cupertino.dart';
import 'package:netflix/application/model/popular.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/search/serchtitle.dart';

const imageurl =
    "https://media.themoviedb.org/t/p/w220_and_h330_face/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key, required List<Popular> popular});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: 'Movies & Tv',
        ),
        kheight,
        Expanded(
            child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1.1 / 1.5,
                children: List.generate(20, (index) {
                  return const maincard();
                })))
      ],
    );
  }
}

class maincard extends StatelessWidget {
  const maincard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image:
              const DecorationImage(image: NetworkImage(imageurl), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}
