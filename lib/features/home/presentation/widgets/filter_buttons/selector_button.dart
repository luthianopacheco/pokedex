import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/core/theme/app_colors.dart';
import 'package:pokedex/features/home/domain/models/selector_item.dart';
import 'package:pokedex/shared/utils/color/color_utils.dart';

class SelectorButton extends StatelessWidget {
  final String modalTitle;
  final List<SelectorItem> items;
  final SelectorItem? selectedItem;
  final void Function(SelectorItem) onSelected;

  const SelectorButton({
    super.key,
    required this.modalTitle,
    required this.items,
    required this.selectedItem,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FilledButton.icon(
        onPressed: () => _showModal(context),
        icon: Icon(
          CupertinoIcons.chevron_down,
          color: selectedItem?.color.contrastColor ?? Theme.of(context).colorScheme.onPrimary,
        ),
        iconAlignment: IconAlignment.end,
        label: Text(
          selectedItem?.label ?? 'Selecione',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: selectedItem?.color.contrastColor ?? Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(selectedItem?.color),
        ),
      ),
    );
  }

  void _showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: AppColors.disabledColor,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            const SizedBox(height: 20),
            Text(modalTitle, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20),
            Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    child: FilledButton(
                      onPressed: () {
                        onSelected(item);
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(item.color),
                      ),
                      child: Text(
                        item.label,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: item.color.contrastColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
