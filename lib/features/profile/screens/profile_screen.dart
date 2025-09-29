import 'package:flutter/material.dart';
import 'package:pokedex/features/profile/widgets/header/profile_unlogged_appbar.dart';
import 'package:pokedex/features/profile/widgets/sections/setting_sections.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileUnloggedAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SettingSections(),
        ),
      ),
    );
  }
}
