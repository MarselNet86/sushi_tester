import 'package:flutter/material.dart';
import 'package:sushi_tester/consts/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';
import 'dart:convert';

class IndicatorData {
  final List<Color> colors;
  final String text;

  IndicatorData(this.colors, this.text);
}

IndicatorData loadIndicatorText(int minValue, int maxValue) {
  if ((maxValue - minValue) >= 6) {
    return IndicatorData([
      AppColors.greenColor,
      AppColors.redColor,
    ], 'Сильная');
  } else if ((maxValue - minValue) >= 3) {
    return IndicatorData([
      AppColors.greenColor,
      AppColors.yellowColor,
      AppColors.redColor,
    ], 'Средняя');
  } else {
    return IndicatorData([
      AppColors.greenColor,
      AppColors.greenColor,
    ], 'Нормальная');
  }
}

Widget workshopAndIndicator(String workshopId, int minValue, int maxValue) {
  IndicatorData indicatorData = loadIndicatorText(minValue, maxValue);

  return Row(
    children: [
      Text(
        workshopId,
        style: GoogleFonts.inter(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Stack(
        children: [
          ProgressBar(
            width: 300,
            height: 35,
            value: 1,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: indicatorData.colors,
            ),
          ),
          Positioned(
            top: 5,
            left: 20,
            child: Text(
              indicatorData.text,
              style: GoogleFonts.inter(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}



Widget tabletCount(int minValue, int maxValue) {
  return Text(
    '$minValue/$maxValue',
    style: GoogleFonts.inter(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.bold,
      fontSize: 32,
    ),
  );
}

Widget orderIds(int orderId) {
  return Text(
    orderId.toString(),
    style: GoogleFonts.inter(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.bold,
      fontSize: 32,
    ),
  );
}

Widget workLoadContent(String workshopName, List<String> workshops) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            workshopName,
            style: GoogleFonts.inter(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          for (var workshop in workshops) ...[
            workshopAndIndicator(
              json.decode(workshop)['workshop'],
              json.decode(workshop)['tabletMinValue'],
              json.decode(workshop)['tabletMaxValue'],
            ),
          ],
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Планшеты',
            style: GoogleFonts.inter(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          for (var workshop in workshops) ...[
            tabletCount(
              json.decode(workshop)['tabletMinValue'],
              json.decode(workshop)['tabletMaxValue'],
            ),
          ],
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Кол-во заказов',
            style: GoogleFonts.inter(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          for (var workshop in workshops) ...[
            orderIds(
              json.decode(workshop)['orderIds'],
            ),
          ],
        ],
      ),
    ],
  );
}
