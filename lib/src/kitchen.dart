import 'package:flutter/material.dart';
import 'package:sushi_tester/consts/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_tester/widgets/success_content.dart';
import 'package:sushi_tester/widgets/shop_content.dart';
import 'package:sushi_tester/widgets/order_indicator.dart';
import 'package:sushi_tester/widgets/workshop_indicator.dart';
import 'package:sushi_tester/app/json_data.dart';
import 'package:sushi_tester/consts/strings.dart';

class KitchenStatistics extends StatelessWidget {
  const KitchenStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _successBlock(),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: _shopBlock(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: _workloadBlock(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _orderBlock(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Container _successBlock() {
  return Container(
    height: 380,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.grayColorLight),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Text(
            AppHeadlinesText.successBlock,
            style: GoogleFonts.inter(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 32),
          ),
          const SizedBox(
            height: 20,
          ),
          successContent(
            AppText.ordersForDelivery,
            '50',
            '15:55',
            AppText.averageDeliveryTime,
          ),
          successContent(
            AppText.ordersForPickup,
            '30',
            '15:55',
            AppText.averagePickupTime,
          ),
        ],
      ),
    ),
  );
}

Container _shopBlock() {
  return Container(
    height: 380,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.grayColorLight
    ),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          shopContent(
              '15м : 34сек',
              AppText.averageTimeOfOrder,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            AppText.holdShop,
            style: GoogleFonts.inter(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 21),
          ),
          const SizedBox(
            height: 10,
          ),
          shopContent(
              '1 час : 34 м',
              AppText.averageTimeOfOrder,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            AppText.coldShop,
            style: GoogleFonts.inter(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 21),
          ),
          const SizedBox(
            height: 10,
          ),
          shopContent(
              '1 час : 40 м',
              AppText.averageTimeOfOrder,
          ),
        ],
      ),
    ),
  );
}

Container _orderBlock() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.grayColorLight),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                AppHeadlinesText.orderBlock,
                style: GoogleFonts.inter(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 32
                ),
              ),
              Text(
                AppHeadlinesText.orderSubTitleBlock,
                style: GoogleFonts.inter(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),
              ),
            ],
          ),
          orderIndicators(orderList),
        ],
      ),
    ),
  );
}

Container _workloadBlock() {
  return Container(
    height: 500,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: AppColors.grayColorLight,
    ),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Text(
            AppHeadlinesText.workloadBlock,
            style: GoogleFonts.inter(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          workLoadContent(
            AppText.holdShop,
            workshopsHot,
          ),
          workLoadContent(
            AppText.coldShop,
            workshopsCold,
          ),
        ],
      ),
    ),
  );
}
