import 'package:flutter/material.dart';
import '../services/role_service.dart';
import '../models/role.dart';

class RoleController extends ChangeNotifier {
  final RoleService _service = RoleService();
  List<Role> _roles = [];

  List<Role> get roles => _roles;

  // Função para carregar os usuários
  Future<void> loadRoles() async {
    try {
      _roles = await _service.getRoles();
      notifyListeners();
    } catch (e) {
      print('Error loading role: $e');
    }
  }

  // Função para adicionar um novo usuário
  Future<void> addRole(Role role) async {
    try {
      final addedRole = await _service.addRole(role);
      _roles.add(addedRole);
      notifyListeners();
    } catch (e) {
      print('Error adding role: $e');
    }
  }

  // Função para remover um usuário

  Future<void> removeRole(int id) async {
    try {
      _service.removeRole(id);
      _roles.removeWhere((role) => role.id == id);
      notifyListeners();
    } catch (e) {
      print('Error deleting role: $e');
    }
  }
}