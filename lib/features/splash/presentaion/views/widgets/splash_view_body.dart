import 'package:book_reservation_app/features/login/presentation/view/login_view.dart';
import 'package:book_reservation_app/features/splash/presentaion/view_models/splash_view_data.dart';
import 'package:book_reservation_app/features/splash/presentaion/views/widgets/splash_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  final PageController pageController = PageController();
  int currentIndex = 0;
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: splashScreensData.length,
              onPageChanged: (index) {
                setState(() => currentIndex = index);
              },
              itemBuilder: (context, index) {
                return SplashItem(
                  data: splashScreensData[index],
                  currentIndex: currentIndex,
                  totalCount: splashScreensData.length,
                  onFirstButtonTap: () {
                    firstButtonTap();
                  },
                  onSecondButtonTap: () {
                    secondButtonTap();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void secondButtonTap() {
    if (currentIndex < splashScreensData.length - 1) {
      Get.off(() => LoginView());
    } else {
      pageController.jumpToPage(0);
    }
  }

  Future<void> firstButtonTap() async {
    if (currentIndex < splashScreensData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('seenSplash', true);
      Get.off(() => LoginView());
    }
  }
}
