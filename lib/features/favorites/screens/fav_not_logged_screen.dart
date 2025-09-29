import 'package:flutter/material.dart';
import 'package:pokedex/features/onboarding/widgets/onboarding_content_widget.dart';
import 'package:pokedex/shared/widgets/appbar/custom_appbar.dart';
import 'package:pokedex/shared/widgets/bages/button_badge.dart';
import 'package:pokedex/shared/widgets/buttons/custom_filled_button.dart';

class FavNotLoggedScreen extends StatelessWidget {
  const FavNotLoggedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleContent: Text(
          'Favoritos',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 328,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 30,
              children: [
                OnboardingContentWidget(
                  image: 'general_images/fav_image_1.png',
                  title: 'Você precisa entrar em uma conta para fazer isso.',
                  description:
                      'Para acessar essa funcionalidade, é necessário fazer login ou criar uma conta. Essa funcionalidade ficará disponível em breve.\nFique ligado!',
                ),

                ButtonBadge(
                  alignment: Alignment.topRight,
                  y: -8,
                  child: CustomButton(
                    textWidget: Text('Entre ou Cadastre-se'),
                    isFilled: false,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
