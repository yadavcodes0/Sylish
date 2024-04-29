import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish/screens/onboarding/widget/onboarding_screen_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  final List<Widget> _onboardingScreens = [
    // Screen 1
    const OnboardingScreenWidget(
      index: 0,
      imageUrl: "assets/images/picture1.jpg",
      tittle: "Choose Products",
      description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    ),

    // Screen 2
    const OnboardingScreenWidget(
      index: 1,
      imageUrl: "assets/images/picture2.jpg",
      tittle: "Make Payment",
      description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    ),

    // Screen 3
    const OnboardingScreenWidget(
      index: 2,
      imageUrl: "assets/images/picture3.jpg",
      tittle: "Get Your Order",
      description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int pageIndex) {
                setState(() {
                  _currentPageIndex = pageIndex;
                });
              },
              children: _onboardingScreens,
            ),
          ),

          // Footer
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // prev button
                Visibility(
                  visible: _currentPageIndex != 0,
                  child: GestureDetector(
                    onTap: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      "Prev",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        color: const Color(0xFFC4C4C4),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                // Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < _onboardingScreens.length; i++)
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        height: 10,
                        width: _currentPageIndex == i ? 50 : 10,
                        decoration: BoxDecoration(
                          color: _currentPageIndex == i
                              ? const Color(0xFF17223B)
                              : const Color(0x3317223B),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                  ],
                ),

                // next button
                (_currentPageIndex != _onboardingScreens.length - 1)
                    ? GestureDetector(
                        onTap: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );

                          setState(() {
                            _currentPageIndex++;
                          });
                        },
                        child: Text(
                          "Next",
                          style: GoogleFonts.montserrat(
                            color: const Color(0xFFF73658),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          "Get Started",
                          style: GoogleFonts.montserrat(
                            color: const Color(0xFFF73658),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
