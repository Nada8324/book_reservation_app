import 'package:book_reservation_app/constant.dart';
import 'package:book_reservation_app/features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: purble,
      body: SplashViewBody());
  }
}
