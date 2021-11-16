class Relationship {
  final int? id;
  final int? userId1;
  final int? userId2;

  Relationship({
    this.id,
    this.userId1,
    this.userId2,
  });

  factory Relationship.fromJson(Map<String, dynamic> json) {
    return Relationship(
      id: json['id'],
      userId1: json['id_user1'],
      userId2: json['id_user2'],
    );
  }
}
