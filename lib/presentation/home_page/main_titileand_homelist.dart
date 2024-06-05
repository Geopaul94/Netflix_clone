import 'package:flutter/material.dart';
import 'package:netflix/presentation/home_page/main_card_home.dart';
import 'package:netflix/presentation/search/serchtitle.dart';

class main_title_and_home_list_card extends StatelessWidget {
  const main_title_and_home_list_card({
    super.key,
    required this.size,
    required this.title,
  });
  final String title;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(
          title: title,
        ),
        const SizedBox(height: 10), // Add space between the title and the list
        LimitedBox(
          maxHeight: size * 0.65,
          maxWidth: size * 0.4,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            padding: const EdgeInsets.symmetric(
                horizontal: 10), // Add padding to the entire list
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 5), // Add space between each item
                child: MainCard_Home(size: size),
              );
            },
          ),
        ),
      ],
    );
  }
}
