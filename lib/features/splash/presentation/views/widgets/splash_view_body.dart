import 'package:book_reservation_app/constant.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purble,
      body: Center(
        child: const Text(
          'Bookly',
          style: TextStyle(fontSize: 78, color: backgroundColor),
        ),
      ),
    );
  }
}
