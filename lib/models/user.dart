class User {
  final int id;
  final String username;
  final String password;
  final String lastName;
  final String firstName;

  User(this.id, this.username, this.password, this.lastName, this.firstName);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'],
      json['username'],
      json['password_'],
      json['last_name'],
      json['first_name'],
    );
  }
}
