// ignore_for_file: prefer_if_null_operators

import 'package:app_movie/synopsis.dart';
import 'package:flutter/material.dart';

import 'package:app_movie/appText.dart';

class TopRated extends StatelessWidget {
  final List toprated;
  TopRated(this.toprated);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const MaterialBanner(
          backgroundColor: Colors.black,
          content:
              myAppText(text: 'Toprated Movies', color: Colors.amber, size: 22),
          actions: [Text('')],
        ),
        // ignore: sized_box_for_whitespace
        Container(
          height: 280,
          child: ListView.builder(
              itemCount: toprated.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => SynopsisPage(
                            name: toprated[index]['title'],
                            synopsis: toprated[index]['overview'],
                            // ignore: prefer_interpolation_to_compose_strings
                            bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                toprated[index]['backdrop_path'],
                            // ignore: prefer_interpolation_to_compose_strings
                            posterUrl: 'https://image.tmdb.org/t/p/w500' +
                                toprated[index]['poster_path'],
                            vote: toprated[index]['vote_average'].toString(),
                            releaseDate: toprated[index]['release_date'])),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: 250,
                    child: Column(children: [
                      Container(
                        height: 200,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(
                                // ignore: prefer_interpolation_to_compose_strings
                                'https://image.tmdb.org/t/p/w500' +
                                    toprated[index]['backdrop_path']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: myAppText(
                          text: toprated[index]['title'] != null
                              ? toprated[index]['title']
                              : toprated[index]['original_name'],
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
    );
  }
}
