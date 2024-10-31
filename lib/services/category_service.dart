import '../models/category.dart';
import '../repositories/category_repository.dart';

class CategoryService {
  final CategoryRepository _repository = CategoryRepository();

  List<Category> getCategories() {
    return _repository.fetchCategories();
  }

  Category addCategory(Category category) {
    return _repository.createCategory(category);
  }

  void removeCategory(int id) {
    return _repository.deleteCategory(id);
  }
}
