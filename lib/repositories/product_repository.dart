import '../models/product.dart';

class ProductRepository {
  final List<Product> _products = [];

  // Busca todos os produtos
  List<Product> fetchProducts() {
    return List.from(_products); // Retorna uma cópia da lista de produtos
  }

  // Cria e adiciona um novo produto à lista
  Product createProduct(Product product) {
    _products.add(product);
    return product; // Retorna o produto criado
  }

  // Remove um produto da lista pelo ID
  void deleteProduct(int id) {
    _products.removeWhere((product) => product.id == id);
  }
}