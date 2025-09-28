import 'package:flutter/cupertino.dart';
import 'package:pokedex/shared/widgets/chips/pokemon_types_widget.dart';

class AttributeListWidget extends StatelessWidget {
  final List<String> list;
  final String title;
  final bool showIcon;
  final BorderStyle borderStyle;
  const AttributeListWidget({
    super.key,
    required this.list,
    required this.title,
    this.showIcon = true,
    this.borderStyle = BorderStyle.none,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        const SizedBox(height: 8),
        PokemonTypesWidget(
          types: list,
          rowMaxWidth: 600,
          itemWidth: 160,
          alignment: WrapAlignment.spaceEvenly,
          showIcon: showIcon,
          borderStyle: borderStyle,
        ),
      ],
    );
  }
}
