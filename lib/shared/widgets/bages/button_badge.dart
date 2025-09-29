import 'package:flutter/material.dart';

class ButtonBadge extends StatelessWidget {
  final Alignment alignment;
  final double y;
  final Widget child;

  const ButtonBadge({
    super.key,
    required this.alignment,
    required this.y,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Badge(
      label: Text(
        'Em Breve',
        style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12),
      ),
      alignment: alignment,
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      offset: Offset(-50, y),
      child: child,
    );
  }
}
