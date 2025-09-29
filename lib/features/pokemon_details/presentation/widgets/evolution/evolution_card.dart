import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/features/home/presentation/widgets/pokemon_card/image_content_card.dart';
import 'package:pokedex/features/pokemon_details/domain/models/evolution.dart';
import 'package:pokedex/shared/utils/text/string_utils.dart';
import 'package:pokedex/shared/widgets/chips/pokemon_types_widget.dart';

class EvolutionCard extends StatelessWidget {
  final Evolution evolution;
  const EvolutionCard({super.key, required this.evolution});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () => context.go('/pokemon_details', extra: evolution.id),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            ImageContentCard(
              imageUrl: evolution.imageUrl ?? '',
              type: evolution.types?.first ?? '',
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  evolution.name.capitalizeFirst(),
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'N°${evolution.id.toString().padLeft(3, '0')}',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                SizedBox(height: 10),
                PokemonTypesWidget(
                  types: evolution.types ?? [],
                  showText: false,
                  rowMaxWidth: screenWidth - 190,
                  alignment: WrapAlignment.center,
                  itemWidth:
                      evolution.types != null && evolution.types!.length > 1
                      ? 97
                      : 190,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
