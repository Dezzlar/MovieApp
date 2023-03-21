import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
//
// ignore: camel_case_types

//Widget class to handle Texts Within the App using google fonts
// ignore: camel_case_types
class myAppText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  //constructor given paramrters to handle text, color and foont size
  const myAppText(
      {required this.text, required this.color, required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(color: color, fontSize: size),
    );
  }
}
