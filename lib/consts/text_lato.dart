import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextLato extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  const TextLato({super.key, required this.text, this.fontSize=16, this.fontWeight, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? Theme.of(context).colorScheme.onSecondary
      )
    ),);
  }
}
