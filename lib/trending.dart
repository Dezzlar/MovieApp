import 'package:app_movie/appText.dart';
import 'package:flutter/material.dart';
import './synopsis.dart';

class TrendingMovies extends StatelessWidget {
  final List trendingList;

  TrendingMovies(this.trendingList);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const MaterialBanner(
          backgroundColor: Colors.black,
          content:
              myAppText(text: 'Trending Now', color: Colors.amber, size: 22),
          actions: [Text('')],
        ),
        // ignore: sized_box_for_whitespace
        Container(
          height: 280,
          child: ListView.builder(
              itemCount: trendingList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => SynopsisPage(
                            // ignore: prefer_if_null_operators
                            name: trendingList[index]['title'] != null
                                ? trendingList[index]['title']
                                : trendingList[index]['original_name'],
                            synopsis: trendingList[index]['overview'],
                            // ignore: prefer_interpolation_to_compose_strings
                            bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                trendingList[index]['backdrop_path'],
                            // ignore: prefer_interpolation_to_compose_strings
                            posterUrl: 'https://image.tmdb.org/t/p/w500' +
                                trendingList[index]['poster_path'],
                            vote:
                                trendingList[index]['vote_average'].toString(),
                            releaseDate: trendingList[index]['release_date'])),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: 250,
                    child: Column(children: [
                      Container(
                        height: 160,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: DecorationImage(
                            image: NetworkImage(
                              // ignore: prefer_interpolation_to_compose_strings
                              'https://image.tmdb.org/t/p/w500' +
                                  trendingList[index]['backdrop_path'],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: myAppText(
                          // ignore: prefer_if_null_operators
                          text: trendingList[index]['title'] != null
                              ? trendingList[index]['title']
                              : trendingList[index]['original_name'],
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ]),
                  ),
                );
              }),
        )
      ]),
    );
  }
}
