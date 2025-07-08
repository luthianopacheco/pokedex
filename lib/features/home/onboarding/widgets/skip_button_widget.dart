import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SkipButtonWidget extends StatelessWidget {
  final String pathTo;
  const SkipButtonWidget({super.key, required this.pathTo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go(pathTo),
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
