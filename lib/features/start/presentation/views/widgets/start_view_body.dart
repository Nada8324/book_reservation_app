import 'package:book_reservation_app/constant.dart';
import 'package:book_reservation_app/features/auth/login/presentation/view/login_view.dart';
import 'package:book_reservation_app/features/splash/presentaion/views/splash_view.dart';
import 'package:book_reservation_app/features/start/presentation/views/widgets/fade_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartViewBody extends StatefulWidget {
  const StartViewBody({super.key});

  @override
  State<StartViewBody> createState() => _StartViewBodyState();
}

class _StartViewBodyState extends State<StartViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    initFadeAnimation();
    navigationMethod();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purple,
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

  Future<void> navigationMethod() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? seenSplash = prefs.getBool('seenSplash') ?? false;
    Future.delayed(
      Duration(seconds: 2),
      () {
        Get.off(() => seenSplash ? LoginView() : SplashView(),
            transition: Transition.fadeIn, duration: transitionDuration);
      },
    );
  }
}
