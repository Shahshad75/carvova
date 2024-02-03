// ignore_for_file: must_be_immutable



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTitles extends StatelessWidget {
  HomeTitles({super.key, required this.titles});
  String titles;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5),
      child: Text(titles,
          style: GoogleFonts.poppins(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }
}



class PriceText extends StatelessWidget {
  PriceText({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Text("₹$title",
        style:
            GoogleFonts.notoSerif(fontSize: 18, fontWeight: FontWeight.w600));
  }
}

class TitleTexts extends StatelessWidget {
  TitleTexts({super.key, required this.text, this.size, this.color});
  final double? size;
  final String text;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.poppins(
            fontSize: size ?? 21,
            fontWeight: FontWeight.w600,
            color: color ?? Colors.black));
  }
}