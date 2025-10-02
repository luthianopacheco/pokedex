import 'package:flutter/material.dart';
import 'package:pokedex/features/onboarding/widgets/onboarding_content_widget.dart';
import 'package:pokedex/features/onboarding/widgets/skip_button_widget.dart';
import 'package:pokedex/gen/assets.gen.dart';
import 'package:pokedex/shared/widgets/badges/button_badge.dart';
import 'package:pokedex/shared/widgets/buttons/custom_filled_button.dart';
import 'package:pokedex/shared/widgets/buttons/custom_text_button.dart';

class OnboardingAccountScreen extends StatelessWidget {
  const OnboardingAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        actions: [SkipButtonWidget(pathTo: '/')],
      ),
      body: Center(
        child: SizedBox(
          width: 322,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OnboardingContentWidget(
                imagePath: Assets.images.onboardingImages.onboarding3.path,
                title: 'Está Pronto para essa aventura?',
                description:
                    'Basta criar uma conta e começar a explorar o mundo dos Pokémon hoje!',
              ),
              const SizedBox(height: 30),
              ButtonBadge(
                y: -12,
                alignment: Alignment.topRight,
                child: CustomButton(
                  textWidget: Text('Criar Conta'),
                  onPressed: () {},
                ),
              ),
              ButtonBadge(
                y: -20,
                alignment: Alignment.centerRight,
                child: CustomTextButton(
                  text: 'Já tenho uma conta',
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
