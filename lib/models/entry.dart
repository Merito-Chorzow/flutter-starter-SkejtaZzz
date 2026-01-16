class Entry {
  final String id;
  final String title;
  final String description;
  final double? latitude;
  final double? longitude;
  final DateTime createdAt;

  Entry({
    required this.id,
    required this.title,
    required this.description,
    this.latitude,
    this.longitude,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
