import 'package:flutter/material.dart';
import 'package:pokedex/shared/widgets/appbar/custom_appbar.dart';
import 'package:pokedex/shared/widgets/badges/button_badge.dart';
import 'package:pokedex/shared/widgets/buttons/custom_filled_button.dart';

class ProfileUnloggedAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProfileUnloggedAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
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
            ButtonBadge(
              alignment: Alignment.topRight,
              y: -8,
              child: CustomButton(
                textWidget: Text('Entre ou Cadastre-se'),
                isFilled: false,
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(189);
}
