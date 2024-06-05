import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/application/controller/popular/popular.dart';
import 'package:netflix/application/model/popular.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/search/search_idle_widget.dart';
import 'package:netflix/presentation/search/search_result.dart';

class Sreen_search extends StatefulWidget {
  const Sreen_search({super.key});

  @override
  State<Sreen_search> createState() => _Sreen_searchState();



}
 

class _Sreen_searchState extends State<Sreen_search> {


   final _controller = TextEditingController();
  List<Popular> popular = [];
  List<Popular> searchResults = [];
  bool isTaped = true;

  
  Timer? _debounce;

  Future<void> getPopular() async {
    popular = await getAllPopular();
  //  setState(() {});
  }

  @override
  void initState() {
    getPopular();
    _controller.text = '';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                controller: _controller,
                onChanged: (value) {

                  if (_debounce != null && _debounce!.isActive) {
                    _debounce!.cancel();
                  }

                  _debounce = Timer(const Duration(milliseconds: 5000), () {
                    // setState(() {
                    //   searchResults = _filterMovies(value);
                    // });
                  });
                },
                backgroundColor: Colors.grey.withOpacity(0.4),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: Colors.white),
              ),
              kheight,
              searchResults.isNotEmpty
                  ? Expanded(
                      child: SearchResultWidget(
                        popular: searchResults,
                      ),
                    )
                  : Expanded(
                      child: SearchIdle_Widget(
                        popular: popular,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

  // List<Popular> _filterMovies(String query) {
  //   return popular.where((movie) {
  //     final title = movie.title.toLowerCase();
  //     final searchLower = query.toLowerCase();
  //     return title.contains(searchLower);
  //   }).toList();
  // }
