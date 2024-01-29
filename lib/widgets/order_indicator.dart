import 'package:flutter/material.dart';
import 'package:sushi_tester/consts/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';


Widget orderIndicators(List<String> orders) {
  List<Widget> widgets = [];

  for (String order in orders) {
    widgets.add(orderIndicator(order));
  }

  return Column(
    children: widgets,
  );
}

Color determineTextColor(String orderDeadline) {
  List<String> timeParts = orderDeadline.split(':');
  int hour = int.parse(timeParts[0]);
  int minute = int.parse(timeParts[1]);
  TimeOfDay orderTime = TimeOfDay(hour: hour, minute: minute);

  if (orderTime.hour >= 12 && orderTime.hour < 14) {
    return AppColors.greenDeepColor;
  } else if (orderTime.hour >= 15 && orderTime.hour < 17) {
    return AppColors.redColor;
  } else { 
    return AppColors.yellowColor;
  }

}

Widget orderIndicator(String order) {
  Map<String, dynamic> jsonData = json.decode(order);

  double percentReadness = jsonData['percentReadness'];
  String orderId = jsonData['orderId'];
  String orderText = jsonData['orderText'];
  String orderDeadline = jsonData['orderDeadline'];

  return Stack(
    children: [
      Align(
        alignment: Alignment.center,
        child: AnimatedProgressBar(
          value: percentReadness,
          height: 55,
          width: double.infinity,
          duration: const Duration(seconds: 2),
          gradient: LinearGradient(
            colors: [
              AppColors.greenColor.withOpacity(0.8),
              AppColors.greenColor,
            ],
          ),
          backgroundColor: AppColors.whiteColor,
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.only(
              left: 10.0,
              top: 7
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.grayColorLight,
              width: 0.5,
            ),
          ),
          child: Center(
            child: Text(
              orderId,
              style: GoogleFonts.inter(
                color: AppColors.backgroundColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
      Positioned(
        top: 5,
        left: 70,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 650),
          child: Text(
            orderText,
            style: GoogleFonts.inter(
              color: AppColors.backgroundColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: const EdgeInsets.only(right: 10.0),
          width: 150,
          child: Center(
            child: Text(
              orderDeadline,
              style: GoogleFonts.inter(
                color: determineTextColor(orderDeadline),
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
          ),
        ),
      ),
      const SizedBox(height: 70,)
    ],
  );
}
