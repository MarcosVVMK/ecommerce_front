import 'package:flutter/material.dart';
import '../models/subcategory.dart';
import '../services/subcategory_service.dart';

class SubCategoryController extends ChangeNotifier {
  final SubCategoryService _service = SubCategoryService();
  List<SubCategory> _sub_categories = [];

  List<SubCategory> get sub_categories => _sub_categories;

  // Função para carregar os produtos
  Future<void> loadSubCategories() async {
    try {
      _sub_categories = await _service.getSubCategories();
      notifyListeners();
    } catch (e) {
      print('Error loading sub categories: $e');
    }
  }

  // Função para adicionar um novo produto
  Future<void> addSubCategory(SubCategory subCategory) async {
    try {
      final addedSubCategory = await _service.addSubCategory(subCategory);
      _sub_categories.add(addedSubCategory);
      notifyListeners();
    } catch (e) {
      print('Error adding subcategory: $e');
    }
  }

  // Função para remover um produto

  Future<void> removeSubCategory(int id) async {
    try {
      _service.removeSubCategory(id);
      _sub_categories.removeWhere((subCategory) => subCategory.id == id);
      notifyListeners();
    } catch (e) {
      print('Error deleting sub category: $e');
    }
  }
}