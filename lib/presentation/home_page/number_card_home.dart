import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class NumberCardHome extends StatelessWidget {
  const NumberCardHome({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: size.width * 0.15,
            ),
            Container(
              width: size.width * 0.4,
              height: size.height * 0.3,
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
            ),
          ],
        ),
        Positioned(
          left: 10,
          top: 110,
          child: BorderedText(
            strokeWidth: 10,
            strokeColor: Colors.white,
            child: Text(
              "${index + 1}", // replace with "${index + 1}" in actual use
              style: TextStyle(
                fontSize: 120,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Inside text color
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
