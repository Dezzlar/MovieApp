import 'package:app_movie/synopsis.dart';
import 'package:flutter/material.dart';

import 'package:app_movie/appText.dart';

class LatestTvShows extends StatelessWidget {
  final List latestList;
  const LatestTvShows(this.latestList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          centerTitle: true,
          title: const myAppText(
              text: 'Now Playing', color: Colors.white, size: 30),
          backgroundColor: Colors.black,
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            // ignore: sized_box_for_whitespace
            Container(
              height: 550,
              child: ListView.builder(
                  itemCount: latestList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => SynopsisPage(
                                name: latestList[index]['title'],
                                synopsis: latestList[index]['overview'],
                                // ignore: prefer_interpolation_to_compose_strings
                                bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                    latestList[index]['backdrop_path'],
                                // ignore: prefer_interpolation_to_compose_strings
                                posterUrl: 'https://image.tmdb.org/t/p/w500' +
                                    latestList[index]['poster_path'],
                                vote: latestList[index]['vote_average']
                                    .toString(),
                                releaseDate: latestList[index]
                                    ['release_date'])),
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
                                        latestList[index]['poster_path']),
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
                              text: latestList[index]['title'] != null
                                  ? latestList[index]['title']
                                  : latestList[index]['original_name'],
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
