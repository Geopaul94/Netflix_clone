import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constants.dart';

class AppbarWidget extends StatelessWidget {
   const AppbarWidget({super.key , required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
   
    return Row(
      children: [
         Text(
         title,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
        ),
        kwidth,
        Container(
          color: Colors.blue,
          height: 30,
          width: 30,
        ),
        kwidth,
      ],
    );
  }
}
