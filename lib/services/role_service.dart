import '../models/role.dart';
import '../repositories/role_repository.dart';

class RoleService {
  final RoleRepository _repository = RoleRepository();

  Future<List<Role>> getRoles() async {
    return _repository.fetchRoles();
  }

   Future<Role> addRole(Role role) async {
    return _repository.createRole(role);
  }

  void removeRole(int id) async {
    return _repository.deleteRole(id);
  }
}
