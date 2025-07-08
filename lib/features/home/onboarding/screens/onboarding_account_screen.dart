import 'package:flutter/material.dart';
import 'package:pokedex/features/home/onboarding/widgets/onboarding_content_widget.dart';
import 'package:pokedex/features/home/onboarding/widgets/skip_button_widget.dart';
import 'package:pokedex/shared/widgets/buttons/custom_filled_button.dart';
import 'package:pokedex/shared/widgets/buttons/custom_text_button.dart';

class OnboardingAccountScreen extends StatelessWidget {
  const OnboardingAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        actions: [SkipButtonWidget(pathTo: '/home')],
      ),
      body: Center(
        child: SizedBox(
          width: 322,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OnboardingContentWidget(
                image: 'onboarding_image_3.png',
                title: 'Está Pronto para essa aventura?',
                description:
                    'Basta criar uma conta e começar a explorar o mundo dos Pokémon hoje!',
              ),
              const SizedBox(height: 30),
              _buildBage(
                context,
                y: -12,
                alignment: Alignment.topRight,
                child: CustomFilledButton(
                  label: 'Criar Conta',
                  onPressed: () {},
                ),
              ),
              _buildBage(
                context,
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

  Widget _buildBage(
    context, {
    required Alignment alignment,
    required double y,
    required Widget child,
  }) {
    return Badge(
      label: Text(
        'Em Breve',
        style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12),
      ),
      alignment: alignment,
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      offset: Offset(-50, y),
      child: child,
    );
  }
}
