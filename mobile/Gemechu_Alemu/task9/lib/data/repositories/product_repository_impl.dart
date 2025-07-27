import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final List<ProductModel> _fakeDB = []; // Replace with real data source

  @override
  Future<void> insertProduct(Product product) async {
    _fakeDB.add(product as ProductModel); // Or convert
  }

  @override
  Future<void> updateProduct(Product product) async {
    final index = _fakeDB.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _fakeDB[index] = product as ProductModel;
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    _fakeDB.removeWhere((p) => p.id == id);
  }

  @override
  Future<Product> getProduct(String id) async {
    return _fakeDB.firstWhere((p) => p.id == id);
  }
}
