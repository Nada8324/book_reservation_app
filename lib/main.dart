import 'package:book_reservation_app/constant.dart';
import 'package:book_reservation_app/features/start/presentation/views/start_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(fontFamily: 'ProximaNovaSoft').copyWith(
                scaffoldBackgroundColor: backgroundColor,
              ),
              home: StartView());
        });
  }
}
