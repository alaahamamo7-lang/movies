import 'package:flutter/material.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/features/onboarding/model/onboarding_model_logic.dart';
import 'package:movies/features/onboarding/ui/widgets/onboarding_page_item.dart';
import 'package:movies/core/constants/routes/app_routes.dart';
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;

  void nextPage() {
    if (currentPage < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(context, AppRoutes.loginScreen());
    }
  }

  void prevPage() {
    if (currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return OnBoardingpage(data: pages[index]);
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    pages[currentPage].title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (pages[currentPage].subtitle.isNotEmpty) ...[
                    Text(
                      pages[currentPage].subtitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 28),
                  ],
                  InkWell(
                    onTap: nextPage,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: AppColors.yellow,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          currentPage == pages.length - 1 ? 'Finish' : 'Next',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (currentPage > 0)
                    InkWell(
                      onTap: prevPage,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.yellow,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Text(
                            'Back',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.yellow,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}