import 'package:flutter/material.dart';
import 'package:sushi_tester/consts/colors.dart';
import 'src/kitchen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const KitchenStatistics(),
      routes: const {
        // NotImplemented
      },
      theme: ThemeData(
        primaryColor: AppColors.backgroundColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
    );
  }
}
