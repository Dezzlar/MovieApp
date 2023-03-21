import 'package:app_movie/appText.dart';
import 'package:flutter/material.dart';
import './synopsis.dart';

class UpcomingMovies extends StatelessWidget {
  final List upcomingList;
  const UpcomingMovies(this.upcomingList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const MaterialBanner(
          backgroundColor: Colors.black,
          content: myAppText(
              text: 'Upcoming Releases', color: Colors.amber, size: 22),
          actions: [Text('')],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 280,
          child: ListView.builder(
              itemCount: upcomingList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => SynopsisPage(
                            name: upcomingList[index]['title'],
                            synopsis: upcomingList[index]['overview'],
                            // ignore: prefer_interpolation_to_compose_strings
                            bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                upcomingList[index]['backdrop_path'],
                            // ignore: prefer_interpolation_to_compose_strings
                            posterUrl: 'https://image.tmdb.org/t/p/w500' +
                                upcomingList[index]['poster_path'],
                            vote:
                                upcomingList[index]['vote_average'].toString(),
                            releaseDate: upcomingList[index]['release_date'])),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: 200,
                    child: Column(children: [
                      Container(
                        height: 150,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                                // ignore: prefer_interpolation_to_compose_strings
                                'https://image.tmdb.org/t/p/w500' +
                                    upcomingList[index]['backdrop_path']),
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
                          text: upcomingList[index]['title'] != null
                              ? upcomingList[index]['title']
                              : upcomingList[index]['original_name'],
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
