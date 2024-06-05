import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/home_page/screen_home.dart';

class BackgroundimageHome extends StatelessWidget {
  const BackgroundimageHome({super.key});

   final imageUrl =
       "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/sh7Rg8Er3tFcN9BpKIPOMvALgZd.jpg";


  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: size * 1.6,
           child: CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) {
              return const Center(child: CircularProgressIndicator());
            },
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomButton(
                title: 'My List',
                iconData: Icons.add,
              ),
              _playButton(),
              const CustomButton(
                title: 'Info',
                iconData: Icons.info,
              ),
            ],
          ),
        ),
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
      onPressed: () {},
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(kwhitecolor),
      ),
      icon: Icon(
        Icons.play_arrow,
        size: 30,
        color: kBlackcolor,
      ),
      label: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          "Play",
          style: TextStyle(color: kBlackcolor),
        ),
      ),
    );
  }
}
