import 'package:flutter/material.dart';

class SkipButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  const SkipButtonWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 5,
          children: [
            Text('Pular', style: Theme.of(context).textTheme.bodyLarge),
            Icon(Icons.arrow_forward_rounded),
          ],
        ),
      ),
    );
  }
}
