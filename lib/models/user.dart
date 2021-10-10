class User {
  final int? id;
  final String? email;
  final String? username;
  final String? password;
  final String? lastName;
  final String? firstName;

  User({
    this.id,
    this.email,
    this.username,
    this.password,
    this.lastName,
    this.firstName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      password: json['password_'],
      lastName: json['last_name'],
      firstName: json['first_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password_": password,
      "last_name": lastName,
      "first_name": firstName,
    };
  }
}

class UserPost {
  final String username;
  final String password;
  final String lastName;
  final String firstName;

  UserPost(
    this.username,
    this.password,
    this.lastName,
    this.firstName,
  );
}
