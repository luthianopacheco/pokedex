import 'package:flutter/material.dart';
import 'package:pokedex/shared/widgets/appbar/custom_appbar.dart';

class RegionsScreen extends StatelessWidget {
  const RegionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleContent: Text(
          'Regiões',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
