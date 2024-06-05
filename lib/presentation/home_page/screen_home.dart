import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/application/controller/now_playing/now_playing.dart';
import 'package:netflix/application/controller/popular/popular.dart';
import 'package:netflix/application/controller/top_rated.dart/top_rated.dart';
import 'package:netflix/application/controller/upcoming/upcoming.dart';
import 'package:netflix/application/model/popular.dart';
import 'package:netflix/application/model/top_rated.dart';
import 'package:netflix/application/model/upcoming.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/home_page/backgroundImage.dart';
import 'package:netflix/presentation/home_page/main_titileand_homelist.dart';
import 'package:netflix/presentation/home_page/number_card_home.dart';
import 'package:netflix/presentation/search/serchtitle.dart';

import '../../application/model/now_playing.dart';

ValueNotifier<bool> scrollnotifier = ValueNotifier(false);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
   List<TopRated>topRated=[];
  List<Popular>popular=[];
  List<Upcoming>upcoming=[];
  List<NowPlaying>newplaying=[];
  Future getAllMovies() async {
    topRated = await getTopRatedMovies();
    popular = await getAllPopular();
    upcoming = await getAllUpcoming();
    newplaying = await getAllNowPlaying();

    // setState(() {});
  }

  @override
  void initState() {
    getAllMovies();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollnotifier,
        builder: (BuildContext context, bool isScrollingUp, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                if (direction == ScrollDirection.reverse) {
                  scrollnotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollnotifier.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  ListView(
                    children: [
                      const BackgroundimageHome(),
                      kheight,
                      main_title_and_home_list_card(
                        size: size,
                        title: "Released in the past year",
                      ),
                      kheight,
                      main_title_and_home_list_card(
                        size: size,
                        title: "Trending Now",
                      ),
                      kheight,
                      number_titile_homescreen_card(size: size),
                      kheight,
                      main_title_and_home_list_card(
                        size: size,
                        title: "Tense Dramas",
                      ),
                      kheight,
                      main_title_and_home_list_card(
                        size: size,
                        title: "South Indian Cinema",
                      ),
                    ],
                  ),
                  scrollnotifier.value == true
                      ? Container(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  kwidth,
                                  Image.network(
                                    "https://imgs.search.brave.com/Vf1pgaqgpA8FIwMksQhZdSvYdmMRy5B838TZzbjIPUw/rs:fit:500:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy8x/LzEwL01ldGEtaW1h/Z2UtbmV0ZmxpeC1z/eW1ib2wtYmxhY2su/cG5n",
                                    height: 85,
                                    width: 80,
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.cast,
                                    color: kwhitecolor,
                                    size: 30,
                                  ),
                                  kwidth,
                                  Container(
                                    width: 30,
                                    height: 30,
                                    color: Colors.blue,
                                  ),
                                  kwidth,
                                ],
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "TV Shows ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("Movies "),
                                  Text("Categories"),
                                ],
                              )
                            ],
                          ),
                        )
                      : kheight,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.iconData,
  }) : super(key: key);

  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          iconData,
          color: Colors.white,
          size: 30,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class number_titile_homescreen_card extends StatelessWidget {
  const number_titile_homescreen_card({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: "Top 10 TV Shows in India",
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: size * 0.65,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (context, index) {
              return SizedBox(
                width: size * 0.6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: NumberCardHome(
                    index: index,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
