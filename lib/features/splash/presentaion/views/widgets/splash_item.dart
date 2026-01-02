import 'package:book_reservation_app/constant.dart';
import 'package:book_reservation_app/features/splash/data/models/splash_view_model.dart';
import 'package:book_reservation_app/core/widgets/dots_indecator.dart';
import 'package:book_reservation_app/features/splash/presentaion/views/widgets/splash_gradiant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashItem extends StatelessWidget {
  final SplashData data;
  final int currentIndex;
  final int totalCount;
  final VoidCallback onFirstButtonTap;
  final VoidCallback onSecondButtonTap;
  const SplashItem(
      {super.key,
      required this.data,
      required this.currentIndex,
      required this.totalCount,
      required this.onFirstButtonTap,
      required this.onSecondButtonTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          data.image,
        ),
        Align(
          alignment: AlignmentGeometry.bottomCenter,
          child: FractionallySizedBox(
            heightFactor: 0.8, // 2/3 of screen height
            widthFactor: 1,
            child: Container(
              decoration: BoxDecoration(gradient: splashGradient),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DotsIndicator(
                      count: totalCount,
                      currentIndex: currentIndex,
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      data.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          color: backgroundColor,
                          fontFamily: null),
                    ),
                    Text(
                      data.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: backgroundColor,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    InkWell(
                      onTap: () {
                        return onFirstButtonTap();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 56.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: backgroundColor),
                        child: Text(
                          data.firstButton,
                          style: TextStyle(
                              color: purple,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          return onSecondButtonTap();
                        },
                        child: Text(data.secondButton,
                            style: TextStyle(
                                color: backgroundColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400)))
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
