import 'package:flutter/material.dart';
import 'package:pokedex/core/routes/screen_transitions.dart';
import 'package:pokedex/features/home/onboarding/controllers/onboarding_controller.dart';
import 'package:pokedex/features/home/onboarding/screens/onboarding_account_screen.dart';
import 'package:pokedex/features/home/onboarding/widgets/onboarding_pageview_widget.dart';
import 'package:pokedex/features/home/onboarding/widgets/onboarding_content_widget.dart';
import 'package:pokedex/features/home/onboarding/widgets/pageview_indicator_widget.dart';
import 'package:pokedex/shared/widgets/buttons/custom_filled_button.dart';
import 'package:pokedex/core/dependency_injection/injectable.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

class OnboardingMainScreen extends StatelessWidget {
  OnboardingMainScreen({super.key});

  final _controller = getIt<OnboardingController>();

  final List<Widget> _pages = const [
    OnboardingContentWidget(
      image: 'onboarding_image_1.png',
      title: 'Todos os Pokémons em um só Lugar',
      description:
          'Acesse uma vasta lista de Pokémon de todas as gerações já feitas pela Nintendo',
    ),
    OnboardingContentWidget(
      image: 'onboarding_image_2.png',
      title: 'Mantenha sua Pokédex atualizada',
      description:
          'Cadastre-se e mantenha seu perfil, pokémon favoritos, configurações e muito mais, salvos no aplicativo, mesmo sem conexão com a internet.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 321,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: 30,
            children: [
              OnboardingPageViewWidget(
                pages: _pages,
                pageController: _controller.pageController,
              ),
              PageviewIndicatorWidget(
                pageController: _controller.pageController,
                length: _pages.length,
              ),
              Observer(
                builder: (context) => CustomFilledButton(
                  textWidget: _buildText(
                    text: _controller.currentPage == _pages.length - 1
                        ? 'Vamos começar!'
                        : 'Continuar',
                    currentPage: _controller.currentPage,
                  ),
                  onPressed: () {
                    if (_controller.currentPage == _pages.length - 1) {
                      _toFinalScreen(context);
                    } else {
                      _controller.pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeOut,
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  void _toFinalScreen(BuildContext context) {
    Navigator.of(context).push(
      ScreenTransitions.slideUpOutNavigator(child: OnboardingAccountScreen()),
    );
  }

  Widget _buildText({required String text, required int currentPage}) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: Text(text, key: ValueKey(currentPage)),
    );
  }
}
