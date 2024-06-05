import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/domain/models/model.dart';
import 'package:netflix/presentation/new&hot/widgets/action_widgets.dart';

class EveryOneWatchingWidget extends StatelessWidget {
  final DownloadModel movie;

  const EveryOneWatchingWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.network(
                'https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png',
                height: 50,
                width: 40,
              ),
              const Text(
                'SERIES',
                style: TextStyle(letterSpacing: 3),
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            movie.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            movie.overview,
            style: const TextStyle(fontSize: 17, color: Colors.grey),
          ),
          const SizedBox(height: 70),
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
          Row(
            children: [
              Image.network(
                'https://www.shopyourtv.com/wp-content/uploads/2019/12/0OtKv5xW_400x400.jpg',
                height: 100,
                width: 100,
                // colorBlendMode: BlendMode.dstOut,
              ),
              const Spacer(),
              const ActionWidgetHot(icon: Icons.share, name: 'Share'),
              const SizedBox(width: 20),
              const ActionWidgetHot(icon: Icons.add, name: 'My List'),
              const SizedBox(width: 20),
              const ActionWidgetHot(icon: Icons.play_arrow, name: 'Play'),
            ],
          ),
        ],
      ),
    );
  }
}
