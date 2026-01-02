import 'package:book_reservation_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final Color backgroundColor;
  final Color textColor;
  final GestureTapCallback onTap;

  const AppButton({
    super.key,
    required this.text,
    this.height = 56,
    this.width = double.infinity,
    this.backgroundColor = purple,
    this.textColor = white,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: textColor, fontSize: 18.sp, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
