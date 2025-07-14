import 'package:flutter/material.dart';
import 'package:pokedex/app.dart';
import 'package:pokedex/core/config/init_configs.dart';

void main() async {
  await InitConfigs.run();
  runApp(const MyApp());
}
