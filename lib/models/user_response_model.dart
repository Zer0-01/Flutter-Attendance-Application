class UserResponseModel {
  final String id;
  final String name;
  final String email;
  final String password;
  final String role;

  UserResponseModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.role});

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      UserResponseModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        password: json['password'],
        role: json['role'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "role": role,
      };
}
