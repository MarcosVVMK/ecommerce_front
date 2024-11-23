import '../models/category.dart';
import '../repositories/category_repository.dart';

class CategoryService {
  final CategoryRepository _repository = CategoryRepository();

  Future<List<Category>> getCategories() async {
    return _repository.fetchCategories();
  }

   Future<Category> addCategory(Category category) async {
    return _repository.createCategory(category);
  }

  void removeCategory(int id) async {
    return _repository.deleteCategory(id);
  }
}
