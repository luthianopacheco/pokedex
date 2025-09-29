import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/core/dependency_injection/injectable.dart';
import 'package:pokedex/features/profile/controllers/profile_controller.dart';
import 'package:pokedex/features/profile/models/setting_item.dart';
import 'package:pokedex/features/profile/widgets/sections/section_widget.dart';

class SettingSections extends StatelessWidget {
  SettingSections({super.key});
  final controller = getIt<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Column(
          children: [
            SectionWidget(
              sectionTitle: 'Pokédex',
              items: [
                SettingItem(
                  title: 'Mega evoluções',
                  subtitle: 'Habilita a exibição de mega evoluções.',
                  isToggled: controller.enableMegaEvolutions,
                  onTap: () => controller.toggleMegaEvolutions(
                    !controller.enableMegaEvolutions,
                  ),
                ),
                SettingItem(
                  title: 'Outras formas',
                  subtitle:
                      'Habilita a exibição de formas alternativas de pokémon.',
                  isToggled: controller.enableOtherForms,
                  onTap: () =>
                      controller.toggleOtherForms(!controller.enableOtherForms),
                ),
              ],
              showSwitchButton: true,
            ),

            SectionWidget(
              sectionTitle: 'Notificações',
              items: [
                SettingItem(
                  title: 'Atualizações na pokédex',
                  subtitle: 'Novos Pokémons, habilidades, informações, etc.',
                  isToggled: controller.notifyPokedexUpdates,
                  onTap: () => controller.togglePokedexUpdates(
                    !controller.notifyPokedexUpdates,
                  ),
                ),
                SettingItem(
                  title: 'Mundo Pokémon',
                  subtitle: 'Acontecimentos e informações do mundo de pokémon.',
                  isToggled: controller.notifyPokemonWorld,
                  onTap: () => controller.togglePokemonWorld(
                    !controller.notifyPokemonWorld,
                  ),
                ),
              ],
            ),

            SectionWidget(
              sectionTitle: 'Idioma',
              showSwitchButton: false,
              items: [
                SettingItem(
                  title: 'Idioma da interface',
                  subtitle: 'Português (PT-BR)',
                  onTap: () {},
                ),
                SettingItem(
                  title: 'Idioma de informações em jogo',
                  subtitle: 'English',
                  onTap: () {},
                ),
              ],
            ),

            SectionWidget(
              sectionTitle: 'Geral',
              showSwitchButton: false,
              items: [
                SettingItem(title: 'Versão', subtitle: '0.1.0'),
                SettingItem(
                  title: 'Termos e condições',
                  subtitle: 'Tudo o que você precisa saber.',
                  onTap: () => debugPrint('Navegar para Termos'),
                ),
                SettingItem(
                  title: 'Central de ajuda',
                  subtitle: 'Precisa de ajuda? Fale conosco',
                  onTap: () => debugPrint('Navegar para Ajuda'),
                ),
                SettingItem(
                  title: 'Sobre',
                  subtitle: 'Saiba mais sobre o app',
                  onTap: () => debugPrint('Navegar para Sobre'),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
