import '../models/product.dart';
import '../repositories/product_repository.dart';

class ProductService {
  final ProductRepository _repository = ProductRepository();

  List<Product> getProducts() {
    return _repository.fetchProducts();
  }

  Product addProduct(Product product) {
    return _repository.createProduct(product);
  }

  void removeProduct(int id) {
    return _repository.deleteProduct(id);
  }
}