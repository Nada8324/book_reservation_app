import 'package:book_reservation_app/constant.dart';
import 'package:book_reservation_app/features/start/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'ProximaNovaSoft').copyWith(
          scaffoldBackgroundColor: backgroundColor,
        ),
        home: SplashView());
  }
}
