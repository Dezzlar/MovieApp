// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:app_movie/appText.dart';
import 'package:app_movie/pages.dart';
import 'package:flutter/material.dart';
import './main.dart';

class SynopsisPage extends StatelessWidget {
  final String name, synopsis, bannerUrl, posterUrl, vote, releaseDate;
  const SynopsisPage(
      {super.key,
      required this.name,
      required this.synopsis,
      required this.bannerUrl,
      required this.posterUrl,
      required this.vote,
      required this.releaseDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Synopsis'),
      ),
      backgroundColor: Colors.teal,
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: ListView(
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const Positioned(
                    child: SizedBox(
                      height: 10,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: myAppText(
                        text: 'Rating ⭐  - $vote',
                        color: Colors.amberAccent,
                        size: 15),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: myAppText(
                  text: name != null ? name : 'original_name',
                  color: Colors.black,
                  size: 25),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: myAppText(
                  text: 'Release Date - ' + releaseDate,
                  color: Colors.white,
                  size: 17),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 120,
                  child: Image.network(posterUrl),
                ),
                Flexible(
                    // ignore: avoid_unnecessary_containers
                    child: Container(
                  child:
                      myAppText(text: synopsis, color: Colors.white, size: 18),
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
