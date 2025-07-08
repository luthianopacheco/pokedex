import 'package:flutter/material.dart';

class OnboardingContentWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingContentWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset('assets/onboarding_images/$image'),
        const SizedBox(height: 30),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 20),
        Text(
          description,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
