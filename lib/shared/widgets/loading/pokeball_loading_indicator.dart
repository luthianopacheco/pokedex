import 'package:flutter/material.dart';
import 'package:pokedex/gen/assets.gen.dart';

class PokeballLoadingIndicator extends StatefulWidget {
  final String? imagePath;
  final double size;

  const PokeballLoadingIndicator({super.key, this.imagePath, this.size = 50.0});

  @override
  State<PokeballLoadingIndicator> createState() =>
      _PokeballLoadingIndicatorState();
}

class _PokeballLoadingIndicatorState extends State<PokeballLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(angle: _controller.value * 10, child: child);
      },

      child: Image.asset(
        widget.imagePath ?? Assets.icons.navIcons.pokedexSelected.path,
        width: widget.size,
        height: widget.size,
      ),
    );
  }
}
