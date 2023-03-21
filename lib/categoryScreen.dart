import 'package:app_movie/toptv.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import './appText.dart';
import './topRated.dart';
import 'recommend.dart';
import './discover.dart';
import './latest.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => CategoryScreenState();
}

class CategoryScreenState extends State<Category> {
  List topRatedMovies = [];
  List topTvShows = [];
  List latestTv = [];
  List recommendedMovies = [];

  List discover = [];
  List genreDrama = [];
  final String apiKey = '6bbf0df89dc48952a10c567d4b01032d';
  List dramaList = [];
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2YmJmMGRmODlkYzQ4OTUyYTEwYzU2N2Q0YjAxMDMyZCIsInN1YiI6IjYzZjNkMjE4NTI0OTc4MDA3Y2I5MDAwYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9C3EuhTpUFKVTPJCaqaNkbaARCEKAmPFYZXaZ0svxHw';

  @override
  void initState() {
    getMovies();
    super.initState();
  }

  getMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));

    Map topRatedList = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map discoverMovies = await tmdbWithCustomLogs.v3.discover.getMovies();
    Map topTvShowsList = await tmdbWithCustomLogs.v3.tv.getTopRated();
    Map recommendedList =
        await tmdbWithCustomLogs.v3.movies.getRecommended(103);
    Map latestTvList = await tmdbWithCustomLogs.v3.movies.getNowPlaying();

    print(latestTvList);

    setState(() {
      topRatedMovies = topRatedList['results'];
      discover = discoverMovies['results'];
      topTvShows = topTvShowsList['results'];
      recommendedMovies = recommendedList['results'];
      latestTv = latestTvList['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
        body: Container(
          child: ListView(
            children: [
              TopRated(topRatedMovies),
              const MaterialBanner(
                backgroundColor: Colors.black,
                content: myAppText(
                    text: 'Categories', color: Colors.amber, size: 22),
                actions: [Text('')],
              ),
              ListTile(
                leading: const Icon(Icons.local_movies_sharp),
                title: const Text('Discover Movies'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => DiscoverMovies(discover)),
                    ),
                  );
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.local_movies),
                title: Text('Now Playing'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => LatestTvShows(latestTv)),
                    ),
                  );
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.local_movies_sharp),
                title: const Text('TopRated Shows'),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => TopTvShows(topTvShows)),
                    ),
                  )
                },
              ),
              Divider(),
              ListTile(
                leading: const Icon(Icons.local_movies),
                title: const Text('Recommended Movies'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) =>
                          RecommendMovies(recommendedMovies)),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ));
  }
}
