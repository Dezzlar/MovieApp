import 'package:app_movie/synopsis.dart';
import 'package:flutter/material.dart';

import 'package:app_movie/appText.dart';

class RecommendMovies extends StatelessWidget {
  final List movieList;
  const RecommendMovies(this.movieList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          centerTitle: true,
          title: const myAppText(
              text: 'Worth Watching', color: Colors.white, size: 30),
          backgroundColor: Colors.black,
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              height: 550,
              child: ListView.builder(
                  itemCount: movieList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => SynopsisPage(
                                name: movieList[index]['title'],
                                synopsis: movieList[index]['overview'],
                                // ignore: prefer_interpolation_to_compose_strings
                                bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                    movieList[index]['backdrop_path'],
                                // ignore: prefer_interpolation_to_compose_strings
                                posterUrl: 'https://image.tmdb.org/t/p/w500' +
                                    movieList[index]['poster_path'],
                                vote:
                                    movieList[index]['vote_average'].toString(),
                                releaseDate: movieList[index]['release_date'])),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        width: 350,
                        child: Column(children: [
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            height: 450,
                            width: 350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    'https://image.tmdb.org/t/p/w500' +
                                        movieList[index]['poster_path']),
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
                              text: movieList[index]['title'] != null
                                  ? movieList[index]['title']
                                  : movieList[index]['original_name'],
                              size: 20,
                              color: Colors.black,
                            ),
                          )
                        ]),
                      ),
                    );
                  }),
            )
          ]),
        ));
  }
}
