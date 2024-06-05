import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/domain/api.dart';
import 'package:netflix/domain/models/model.dart';
import 'package:netflix/presentation/new&hot/widgets/coming_soon_widget.dart';
import 'package:netflix/presentation/new&hot/widgets/everyone_watching_widget.dart';
 

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              bottom: TabBar(
                padding: const EdgeInsets.symmetric(vertical: 10),
                tabAlignment: TabAlignment.center,
                labelPadding: const EdgeInsets.only(right: 30),
                dividerColor: Colors.black,
                isScrollable: true,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                tabs: const [
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Tab(
                      text: '🍿 Coming soon',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Tab(
                      text: "👀 Everyone's Watching",
                    ),
                  ),
                ],
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  color: Colors.white,
                  size: 25,
                ),
                const SizedBox(width: 10),
                Container(
                  color: Colors.blue,
                  width: 25,
                  height: 25,
                ),
                const SizedBox(width: 10),
              ],
              backgroundColor: Colors.black,
              title: const Text(
                'New & Hot',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              _buildComingSoon(context),
              _buildEveryOnes(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildComingSoon(BuildContext context) {
    return FutureBuilder<List<DownloadModel>>(
      future: Api().getTrending(), // Fetch trending movies using API
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        } else {
          return ListView.builder(
            itemBuilder: (context, index) => ComingSoonTileWidget(
                size: MediaQuery.of(context).size,
                movie: snapshot.data![index]),
            itemCount: snapshot.data!.length,
          );
        }
      },
    );
  }

  Widget _buildEveryOnes() {
    return FutureBuilder<List<DownloadModel>>(
      future: Api().getTrending(), // Fetch trending movies using API
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        } else {
          return ListView.separated(
            itemBuilder: (context, index) =>
                EveryOneWatchingWidget(movie: snapshot.data![index]),
            separatorBuilder: (context, index) => kheight,
            itemCount: snapshot.data!.length,
          );
        }
      },
    );
  }
}
