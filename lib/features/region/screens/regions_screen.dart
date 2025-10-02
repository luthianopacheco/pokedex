import 'package:flutter/material.dart';
import 'package:pokedex/features/onboarding/widgets/onboarding_content_widget.dart';
import 'package:pokedex/gen/assets.gen.dart';
import 'package:pokedex/shared/widgets/appbar/custom_appbar.dart';

class RegionsScreen extends StatelessWidget {
  const RegionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleContent: Text(
          'Regiões',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 328,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 30,
            children: [
              OnboardingContentWidget(
                imagePath: Assets.images.generalImages.favImage2.path,
                title: 'Pesquise Pokémons por região.',
                description:
                    'Em breve será disponibilizado uma nova atualização para encontrar seus Pokémons através das regiões.\nFique ligado!',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
