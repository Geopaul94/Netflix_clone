// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:netflix/presentation/downloads/widgets/screen_downloads.dart';
import 'package:netflix/presentation/fast_laught/fast_laugh.dart';
import 'package:netflix/presentation/home_page/screen_home.dart';
import 'package:netflix/presentation/mainpage/widgets/bottom_navigator.dart';
import 'package:netflix/presentation/new&hot/screen_new_and_hot.dart';
import 'package:netflix/presentation/search/screen_search.dart';

class screenMainPage extends StatelessWidget {
  screenMainPage({super.key});

  final _pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
     const Screen_Fast_Laugh(),
    const Sreen_search(),
    ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: IndexChangeNotifier,
            builder: (context, int index, _) {
              return _pages[index];
            },
          ),
        ),
        bottomNavigationBar: const BottomNavigationWidget());
  }
}
