class User {
  final int id;
  final String email;
  final String image;
  final String username;
  final String password;
  final String lastName;
  final String firstName;

  User({
    required this.id,
    required this.image,
    required this.email,
    required this.username,
    required this.password,
    required this.lastName,
    required this.firstName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      image: json['image_'],
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
