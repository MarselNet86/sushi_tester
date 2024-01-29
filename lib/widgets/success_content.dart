import 'package:flutter/material.dart';
import 'package:sushi_tester/consts/colors.dart';
import 'package:google_fonts/google_fonts.dart';


Widget successContent(
    String orderTitle,
    String orderCount,
    String orderTime,
    String orderSubTitle,
    ) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            orderTitle,
            style: GoogleFonts.inter(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 21
            ),
          ),
          Text(
            orderCount,
            style: GoogleFonts.inter(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 21
            ),
          ),
        ],
      ),
      Row(
        children: [
          Text(
            orderTime,
            style: GoogleFonts.inter(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 50
            ),
          ),
          const SizedBox(width: 16.0),
          Flexible(
            child: Text(
              orderSubTitle,
              style: GoogleFonts.inter(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
              softWrap: true,
            ),
          ),
        ],
      )
    ],
  );
}