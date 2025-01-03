import 'package:flutter/material.dart';
import '../services/user_service.dart';
import '../models/user.dart';

class UserController extends ChangeNotifier {
  final UserService _service = UserService();
  List<User> _users = [];

  List<User> get users => _users;

  // Função para carregar os usuários
  Future<void> loadUsers() async {
    try {
      _users = await _service.getUsers();
      notifyListeners();
    } catch (e) {
      print('Error loading user: $e');
    }
  }

  // Função para adicionar um novo usuário
  Future<void> addUser(User user) async {
    try {
      final addedUser = await _service.addUser(user);
      _users.add(addedUser);
      notifyListeners();
    } catch (e) {
      print('Error adding user: $e');
    }
  }

  // Função para remover um usuário

  Future<void> removeUser(int id) async {
    try {
      _service.removeUser(id);
      _users.removeWhere((user) => user.id == id);
      notifyListeners();
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}