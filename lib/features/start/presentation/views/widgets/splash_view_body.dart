import 'package:book_reservation_app/constant.dart';
import 'package:book_reservation_app/features/splash/presentaion/views/splash1.dart';
import 'package:book_reservation_app/features/start/presentation/views/widgets/fade_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  @override
  void initState() {
    super.initState();
    initFadeAnimation();
    Future.delayed(
      Duration(seconds: 2),
      () {
        Get.to(const Splash1(),
            transition: Transition.fadeIn, duration: transitionDuration);
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purble,
      body: FadeText(fadeAnimation: fadeAnimation),
    );
  }

  void initFadeAnimation() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
      ),
    );
    animationController.forward();
  }
}
