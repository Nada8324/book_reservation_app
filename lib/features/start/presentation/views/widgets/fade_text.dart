import 'package:book_reservation_app/constant.dart';
import 'package:flutter/material.dart';

class FadeText extends StatelessWidget {
  const FadeText({
    super.key,
    required this.fadeAnimation,
  });

  final Animation<double> fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: fadeAnimation,
        child: const Text(
          'Bookly',
          style: TextStyle(
            fontSize: 78,
            color: backgroundColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
