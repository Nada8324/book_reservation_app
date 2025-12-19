import 'package:book_reservation_app/features/splash/data/splash_view_data.dart';
import 'package:book_reservation_app/features/splash/presentaion/views/widgets/splash_item.dart';
import 'package:flutter/material.dart';

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
      // Get.off(() => LoginView());
    } else {
      // آخر صفحة → نرجع للشاشة الأولى
      pageController.jumpToPage(0);
    }
  }

  void firstButtonTap() {
    if (currentIndex < splashScreensData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      // Get.off(() => LoginView());
    }
  }
}
