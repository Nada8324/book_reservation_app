import 'package:book_reservation_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotsIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;
  final double? width;
  final double? height;
  final Color activeColor;
  final Color inActiveColor;
  final double spacing;

  const DotsIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
    this.activeColor = purple,
    this.inActiveColor = purple5,
    this.height,
    this.width,
    this.spacing = 6,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final availableWidth = screenWidth - 48;
    final dotWidth =
        width ?? ((availableWidth - (spacing * (count - 1))) / count);
    final dotHeight = height ?? 8;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 6),
          width: dotWidth,
          height: dotHeight,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? Colors.white
                : Colors.white.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
