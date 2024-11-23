import '../models/role.dart';

class RoleRepository {
  static final List<Role> _roles = []; // Lista interna de usuarios
  static int _nextId = 1; // Variável para acompanhar o próximo ID disponível

  // Simula a latência de uma chamada a um backend
  Future<void> _simulateNetworkDelay() async {
    await Future.delayed(
        const Duration(milliseconds: 10)); // Simula um atraso de 10 milissegundos
  }

  // Função para buscar todas as usuarios
  Future<List<Role>> fetchRoles() async {
    await _simulateNetworkDelay(); // Aguarda o atraso simulado
    return List.from(_roles); // Retorna uma cópia da lista de usuarios
  }

  // Função para criar uma nova usuario
  Future<Role> createRole(Role role) async {
    await _simulateNetworkDelay(); // Aguarda o atraso simulado
    role.id = _nextId++; // Atribui o próximo ID e incrementa a variável
    _roles.add(role); // Adiciona a nova usuario à lista
    return role; // Retorna a usuario criada
  }

  // Função para deletar uma usuario
  Future<void> deleteRole(int id) async {
    await _simulateNetworkDelay(); // Aguarda o atraso simulado
    _roles.removeWhere(
        (role) => role.id == id); // Remove a usuario da lista
  }
}