import 'package:flutter/material.dart';

class OnboardingPageViewWidget extends StatelessWidget {
  final List<Widget> pages;
  final PageController pageController;
  const OnboardingPageViewWidget({
    super.key,
    required this.pages,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        itemCount: pages.length,
        itemBuilder: (context, index) => pages[index],
      ),
    );
  }
}
