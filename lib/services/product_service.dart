import '../models/product.dart';
import '../repositories/product_repository.dart';

class ProductService {
  final ProductRepository _repository = ProductRepository();

  Future<List<Product>> getProducts() async {
    return _repository.fetchProducts();
  }

  Future<Product> addProduct(Product product) async {
    return _repository.createProduct(product);
  }

  void removeProduct(int id) async {
    return _repository.deleteProduct(id);
  }
}