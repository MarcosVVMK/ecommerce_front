import '../models/subcategory.dart';
import '../repositories/subcategory_repository.dart';

class SubCategoryService {
  final SubCategoryRepository _repository = SubCategoryRepository();

  Future<List<SubCategory>> getSubCategories() async {
    return _repository.fetchSubCategories();
  }

  Future<SubCategory> addSubCategory(SubCategory subCategory) async {
    return _repository.createSubCategory(subCategory);
  }

  void removeSubCategory(int id) async {
    return _repository.deleteSubCategory(id);
  }
}
