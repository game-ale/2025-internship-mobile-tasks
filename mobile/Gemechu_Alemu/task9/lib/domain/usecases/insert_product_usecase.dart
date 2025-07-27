import '../entities/product.dart';
import '../repositories/product_repository.dart';

class InsertProductUsecase {
  final ProductRepository repository;

  InsertProductUsecase(this.repository);

  Future<void> call(Product product) {
    return repository.insertProduct(product);
  }
}
