import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/presentation/fast_laught/widgets/video_list_item.dart';

class Screen_Fast_Laugh extends StatelessWidget {
  const Screen_Fast_Laugh({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) {
            return VideoListItem(
              index: index,
            );
          },
        ),
      ),
    );
  }
}
