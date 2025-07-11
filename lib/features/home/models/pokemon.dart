class Pokemon {
  final int id;
  final String name;
  final List<String> types;
  final String image;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.image,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: _capitalizeFirst(json['name']),
      types: (json['types'] as List)
          .map((e) => _capitalizeFirst(e['type']['name']))
          .toList(),

      image: json['sprites']['front_default'] ?? '',
    );
  }

  static String _capitalizeFirst(String value) {
    if (value.isEmpty) return value;
    return value[0].toUpperCase() + value.substring(1);
  }
}
