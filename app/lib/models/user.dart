class User {
  final String id;
  final String displayName;
  final DateTime createdAt;

  User({
    required this.id,
    required this.displayName,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'displayName': displayName,
        'createdAt': createdAt.toIso8601String(),
      };

  factory User.fromMap(Map<String, dynamic> map) => User(
        id: map['id'],
        displayName: map['displayName'],
        createdAt: DateTime.parse(map['createdAt']),
      );
}
