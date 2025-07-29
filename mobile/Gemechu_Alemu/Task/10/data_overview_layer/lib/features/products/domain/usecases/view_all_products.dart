import '../entities/product.dart';
import '../repositories/product_repository.dart';

class ViewAllProducts {
  final ProductRepository repository;

  ViewAllProducts(this.repository);

  Future<List<Product>> call() {
    return repository.getAllProducts();
  }
}
