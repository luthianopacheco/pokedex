import 'package:flutter/material.dart';
import 'package:pokedex/features/home/data/models/selector_item_data.dart';
import 'package:pokedex/features/home/domain/models/order_options.dart';

class OrderOptionsData implements SelectorItemData {
  @override
  final String type;
  @override
  final String label;
  @override
  final Color color;

  OrderOptionsData({
    required this.type,
    required this.label,
    required this.color,
  });

  factory OrderOptionsData.fromJson(Map<String, dynamic> json) {
    return OrderOptionsData(
      type: json['type'],
      label: json['label'],
      color: Color(int.parse(json['color'].replaceFirst('#', '0xff'))),
    );
  }

  OrderOptions toDomain() {
    return OrderOptions(type: type, label: label, color: color);
  }
}
