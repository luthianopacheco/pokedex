import 'package:flutter/material.dart';
import 'package:pokedex/features/profile/models/setting_item.dart';
import 'package:pokedex/features/profile/widgets/sections/section_item.dart';

class SectionWidget extends StatelessWidget {
  final String sectionTitle;
  final List<SettingItem> items;
  final bool showSwitchButton;
  const SectionWidget({
    super.key,
    required this.sectionTitle,
    required this.items,
    this.showSwitchButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final sectionTitleStyle = Theme.of(context).textTheme.titleSmall?.copyWith(
      color: Theme.of(context).colorScheme.onSurface,
    );

    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(sectionTitle, style: sectionTitleStyle),
          ...items.map(
            (item) =>
                SectionItem(item: item, showSwitchButton: showSwitchButton),
          ),
        ],
      ),
    );
  }
}
