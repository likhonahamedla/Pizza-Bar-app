import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var color = Color.fromARGB(255, 145, 54, 48);
Color buttonColor = Color.fromARGB(255, 108, 48, 43);
TextStyle text({
  required double fontSize,
  required FontWeight fontWeight,
  Color color = Colors.black87,
}) {
  return GoogleFonts.roboto(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

class ShopeName extends StatelessWidget {
  double fontSize;
  Color color = Colors.black87;
  ShopeName({super.key, required this.fontSize, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      'PIZZA BAR',
      style: GoogleFonts.bungeeInline(
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        color: color,
      ),
    );
  }
}
