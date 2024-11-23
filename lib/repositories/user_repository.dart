import '../models/user.dart';

class UserRepository {
  static final List<User> _users = []; // Lista interna de usuarios
  static int _nextId = 1; // Variável para acompanhar o próximo ID disponível

  // Simula a latência de uma chamada a um backend
  Future<void> _simulateNetworkDelay() async {
    await Future.delayed(
        const Duration(milliseconds: 10)); // Simula um atraso de 10 milissegundos
  }

  // Função para buscar todas as usuarios
  Future<List<User>> fetchUsers() async {
    await _simulateNetworkDelay(); // Aguarda o atraso simulado
    return List.from(_users); // Retorna uma cópia da lista de usuarios
  }

  // Função para criar uma nova usuario
  Future<User> createUser(User user) async {
    await _simulateNetworkDelay(); // Aguarda o atraso simulado
    user.id = _nextId++; // Atribui o próximo ID e incrementa a variável
    _users.add(user); // Adiciona a nova usuario à lista
    return user; // Retorna a usuario criada
  }

  // Função para deletar uma usuario
  Future<void> deleteUser(int id) async {
    await _simulateNetworkDelay(); // Aguarda o atraso simulado
    _users.removeWhere(
        (user) => user.id == id); // Remove a usuario da lista
  }
}