import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageviewIndicatorWidget extends StatelessWidget {
  final PageController pageController;
  final int length;
  const PageviewIndicatorWidget({
    super.key,
    required this.pageController,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: length,
      effect: CustomizableEffect(
        activeDotDecoration: DotDecoration(
          width: 32,
          height: 10,
          color: const Color(0xff173EA5),
          borderRadius: BorderRadius.circular(8),
        ),
        dotDecoration: DotDecoration(
          width: 8,
          height: 8,
          color: Color(0xff4565B7),
          borderRadius: BorderRadius.circular(8),
        ),
        spacing: 8.0,
      ),
    );
  }
}
