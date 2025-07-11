import 'package:flutter/material.dart';
import 'package:pokedex/shared/widgets/appbar/custom_appbar.dart';
import 'package:pokedex/shared/widgets/buttons/custom_filled_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        bottomContent: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      'Mantenha sua Pokédex atualizada e participe desse mundo.',
                    ),
                  ),
                  Image.asset(
                    'assets/images/onboarding_images/onboarding-3.png',
                    height: 100,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomButton(
                textWidget: Text('Entre ou Cadastre-se'),
                isFilled: false,
                onPressed: () {},
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
