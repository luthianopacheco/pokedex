class Evolution {
  final int id;
  final String name;
  final int? minLevel;
  final String? url;
  final String? imageUrl;
  final List<String>? types;

  Evolution({
    required this.id,
    required this.name,
    this.minLevel,
    this.url,
    this.imageUrl,
    this.types,
  });
}
