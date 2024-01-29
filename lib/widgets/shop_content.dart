import 'package:flutter/material.dart';
import 'package:sushi_tester/consts/colors.dart';
import 'package:google_fonts/google_fonts.dart';

Widget shopContent(
    String shopTime,
    String shopSubTitle,
    ) {
  return Column(
    children: [
      Text(
        shopTime,
        style: GoogleFonts.inter(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 30
        ),
      ),
      const SizedBox(height: 5),
      Text(
        shopSubTitle,
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 18
        ),
      ),
    ],
  );
}