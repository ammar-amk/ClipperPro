import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<Widget> _pages = [
    const OnboardingPage(
      title: 'Welcome to ClipperPro',
      description: 'Find the best barbers near you',
      imagePath: 'assets/onboarding1.png',
    ),
    const OnboardingPage(
      title: 'Book Your Barber',
      description: 'Easily schedule appointments with your favorite barbers',
      imagePath: 'assets/onboarding2.png',
    ),
    const OnboardingPage(
      title: 'Get a Fresh Haircut',
      description: 'Experience professional grooming services',
      imagePath: 'assets/onboarding3.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
    checkOnboardingStatus();
  }

  void checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;

    if (hasSeenOnboarding) {
      // User has already seen the onboarding screen
      // Navigate to the next screen (e.g., home screen)
      // Replace the below line with your navigation logic
      Navigator.pushReplacementNamed(context, '/signup');
    }
  }

  void setOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return _pages[index];
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: List.generate(
                  _pages.length,
                      (index) => buildDot(index),
                ),
              ),
              if (_currentPage != _pages.length - 1)
                TextButton(
                  onPressed: () {
                    _pageController.jumpToPage(_pages.length - 1);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              if (_currentPage == _pages.length - 1)
                TextButton(
                  onPressed: () {
                    setOnboardingStatus();
                    // Navigate to the next screen (e.g., home screen)
                    // Replace the below line with your navigation logic
                    Navigator.pushReplacementNamed(context, '/signup');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6.0),
      width: _currentPage == index ? 12.0 : 6.0,
      height: 6.0,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const OnboardingPage({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          height: 200.0,
          width: 200.0,
        ),
        const SizedBox(height: 32.0),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16.0),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
