import '../models/user.dart';
import '../repositories/user_repository.dart';

class UserService {
  final UserRepository _repository = UserRepository();

  Future<List<User>> getUsers() async {
    return _repository.fetchUsers();
  }

   Future<User> addUser(User user) async {
    return _repository.createUser(user);
  }

  void removeUser(int id) async {
    return _repository.deleteUser(id);
  }
}
