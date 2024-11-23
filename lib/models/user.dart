

class User {
  int id;
  String userName;
  String password;
  int roleId;
  // Construtor da classe User
  User({
    required this.id,
    required this.userName,
    required this.password,
    required this.roleId,
  });

  // Fábrica que cria uma instância de User a partir de um JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      userName: json['userName'],
      password: json['password'],
      roleId: json['roleId'],
    );
  }

  // Método que converte uma instância de User para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'password': password,
      'roleId': roleId,
    };
  }
}
