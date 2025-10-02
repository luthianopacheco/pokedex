import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/core/theme/app_colors.dart';
import 'package:pokedex/features/profile/models/setting_item.dart';

class SectionItem extends StatelessWidget {
  final SettingItem item;
  final bool showSwitchButton;
  const SectionItem({
    super.key,
    required this.item,
    this.showSwitchButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final itemTitleStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: Theme.of(context).colorScheme.onSurface,
      fontWeight: FontWeight.bold,
    );

    return Observer(
      builder: (context) {
        Widget? trailingWidget;

        if (showSwitchButton) {
          trailingWidget = Switch(
            value: item.isToggled,
            onChanged: (value) => item.onTap?.call(),
          );
        } else if (item.onTap != null) {
          trailingWidget = const Icon(
            Icons.chevron_right,
            color: AppColors.disabledColor,
          );
        }

        return InkWell(
          onTap: item.onTap,
          child: ListTile(
            title: Text(item.title, style: itemTitleStyle),
            subtitle: Text(item.subtitle),
            trailing: trailingWidget,
            contentPadding: EdgeInsets.zero,
          ),
        );
      },
    );
  }
}
