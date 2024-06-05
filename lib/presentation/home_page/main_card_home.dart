import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class MainCard_Home extends StatelessWidget {
  const MainCard_Home({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size * 0.4,
      height: size * 0.65,
      decoration: BoxDecoration(
        color: kwhitecolor,
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: NetworkImage(
            "https://media.themoviedb.org/t/p/w250_and_h141_face/9wJO4MBzkqgUZemLTGEsgUbYyP6.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
