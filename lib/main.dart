import 'package:app_movie/trending.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import './upcoming.dart';
import './pages.dart';
import './navbar.dart';
import 'package:path/path.dart';
import 'settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Pages(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.teal),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List upcomingReleases = [];

  final String apiKey = '6bbf0df89dc48952a10c567d4b01032d';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2YmJmMGRmODlkYzQ4OTUyYTEwYzU2N2Q0YjAxMDMyZCIsInN1YiI6IjYzZjNkMjE4NTI0OTc4MDA3Y2I5MDAwYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9C3EuhTpUFKVTPJCaqaNkbaARCEKAmPFYZXaZ0svxHw';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingList = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map upcomingList = await tmdbWithCustomLogs.v3.movies.getUpcoming();

    setState(() {
      trendingMovies = trendingList['results'];

      upcomingReleases = upcomingList['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      drawer: const NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Movie App ',
          style: TextStyle(color: Colors.amber),
        ),
      ),
      body: ListView(
        children: [
          TrendingMovies(trendingMovies),
          UpcomingMovies(upcomingReleases),
        ],
      ),
    );
  }
}
