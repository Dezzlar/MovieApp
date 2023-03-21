// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:app_movie/synopsis.dart';
import 'package:flutter/material.dart';

import 'package:app_movie/appText.dart';

class TopTvShows extends StatelessWidget {
  final List topTvList;
  const TopTvShows(this.topTvList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          centerTitle: true,
          title: const myAppText(
              text: 'Top Tv Shows', color: Colors.white, size: 30),
          backgroundColor: Colors.black,
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              height: 550,
              child: ListView.builder(
                  itemCount: topTvList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => SynopsisPage(
                                name: topTvList[index]['title'],
                                synopsis: topTvList[index]['overview'],
                                // ignore: prefer_interpolation_to_compose_strings
                                bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                    topTvList[index]['backdrop_path'],
                                // ignore: prefer_interpolation_to_compose_strings
                                posterUrl: 'https://image.tmdb.org/t/p/w500' +
                                    topTvList[index]['poster_path'],
                                vote:
                                    topTvList[index]['vote_average'].toString(),
                                releaseDate: topTvList[index]['release_date'])),
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
                                    'https://image.tmdb.org/t/p/w500' +
                                        topTvList[index]['poster_path']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // ignore: prefer_const_constructors
                          SizedBox(
                            height: 10,
                          ),
                          myAppText(
                            // ignore: prefer_if_null_operators
                            text: topTvList[index]['title'] != null
                                ? topTvList[index]['title']
                                : topTvList[index]['original_name'],
                            size: 20,
                            color: Colors.black,
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
