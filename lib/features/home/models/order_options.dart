import 'package:flutter/material.dart';
import 'package:pokedex/features/home/models/selector_item.dart';

class OrderOptions implements SelectorItem {
  @override
  final String type;
  @override
  final String label;
  @override
  final Color color;

  OrderOptions({required this.type, required this.label, required this.color});
}

final orderOptionsList = [
  OrderOptions(
    type: 'ordered-number',
    label: 'Menor número',
    color: Color(0xff333333),
  ),
  OrderOptions(
    type: 'reverse-number',
    label: 'Maior número',
    color: Color(0xff63BC5A),
  ),
  OrderOptions(type: 'ordered-letter', label: 'A-Z', color: Color(0xff0B6DC3)),
  OrderOptions(type: 'reverse-letter', label: 'Z-A', color: Color(0xffF4D23C)),
];
