class Country {
  const Country({
    required this.name,
    required this.size,
  });

  final String name;

  final int size;

  @override
  String toString() {
    return '$name ($size)';
  }
}
