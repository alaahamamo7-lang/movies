import 'package:flutter/material.dart';
import 'package:movies/modules/login/login_screen.dart';
class OnBoardingScreenData {
  final String imagePath;
  final String title;
  final String subtitle;
  final bool showLogo;

  OnBoardingScreenData({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    this.showLogo = false,
  });
}
final List<OnBoardingScreenData> pages = [
  OnBoardingScreenData(
    imagePath: 'assets/movies_posters.png',
    title: 'Find Your Next  Favorite Movie Here',
    subtitle: 'Get access to a huge library of movies to suit all tastes. '
        'You will surely like it.',
  ),
  OnBoardingScreenData(
    imagePath: 'assets/onboarding_2.png',
    title: 'Discover Movies',
    subtitle: 'Explore a vast collection of movies in all  qualities and genres. Find your next Favorite film with ease',
  ),
  OnBoardingScreenData(
    imagePath: 'assets/onboarding_3.png',
    title: 'Explore All Genres',
    subtitle: 'Discover movies from every genre,in all in all available qualities. Find something new and exciting to watch every day',
  ),
  OnBoardingScreenData(
    imagePath: 'assets/onboarding_4.png',
    title: 'Create Watchlists',
    subtitle: 'Save movies to your watchlist to keep  track of what you want to watch next. Enjoy films in various qualities and genres.',
  ),
  OnBoardingScreenData(
    imagePath: 'assets/onboarding_5.png',
    title: 'Rate, Review,and Learn',
    subtitle: "Share your thoughts on the movies you've watched.Dive deep into film details and help others discover great movies with your reviews.",
  ),
  OnBoardingScreenData(
      imagePath: 'assets/onboarding_5.png',
      title: 'Start Watching Now',
      subtitle: ''
  ),
];

class OnBoardingController {
  final PageController pageController = PageController();
  int currentPage = 0;

  void nextPage(BuildContext context) {
    if (currentPage < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
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

  void dispose() {
    pageController.dispose();
  }
}