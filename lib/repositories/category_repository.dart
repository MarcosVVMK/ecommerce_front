import '../models/category.dart';

class CategoryRepository {
  final List<Category> _categories = [];

  // Busca todos os produtos
  List<Category> fetchCategories() {
    return List.from(_categories); // Retorna uma cópia da lista de produtos
  }

  // Cria e adiciona um novo produto à lista
  Category createCategory(Category category) {
    _categories.add(category);
    return category; // Retorna o produto criado
  }

  // Remove um produto da lista pelo ID
  void deleteCategory(int id) {
    _categories.removeWhere((category) => category.id == id);
  }
}