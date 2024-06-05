import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/domain/models/model.dart';

class ComingSoonTileWidget extends StatelessWidget {
  final DownloadModel movie;
  final Size size;

  String convertDateToMonth(String dateStr) {
    DateTime date = DateTime.parse(dateStr);
    DateFormat monthFormat = DateFormat.MMM();
    return monthFormat.format(date);
  }

  const ComingSoonTileWidget({
    super.key,
    required this.movie,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Coming on Friday',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Image.network(
                      'https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png',
                      height: 50,
                      width: 40,
                    ),
                  ],
                ),
                const Text(
                  'FILM',
                  style: TextStyle(letterSpacing: 3),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                movie.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                movie.overview,
                style: const TextStyle(fontSize: 17, color: Colors.grey),
              ),
            ),
            kheight,
            Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        convertDateToMonth(movie.releaseDate).toUpperCase(),
                        style:
                            const TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      const Text(
                        '11',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width - 50,
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 200,
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Positioned(
                            right: 10,
                            bottom: 10,
                            child: CircleAvatar(
                              backgroundColor: Colors.black38,
                              radius: 20,
                              child: Icon(
                                Icons.volume_mute_outlined,
                                color: kwhitecolor,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      kheight,
                      Row(
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              movie.title,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Icon(
                                Icons.notification_important,
                                color: kwhitecolor,
                                size: 20,
                              ),
                              Text(
                                'Remind me',
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                          kwidth,
                          Column(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: kwhitecolor,
                                size: 20,
                              ),
                              Text(
                                'Info',
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                          kwidth
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
