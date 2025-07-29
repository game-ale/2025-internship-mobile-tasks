
import 'package:flutter_test/flutter_test.dart';
import 'package:data_overview_layer/features/products/domain/repositories/product_repository.dart';
import 'package:data_overview_layer/features/products/domain/entities/product.dart';

class FakeProductRepository implements ProductRepository {
  final List<Product> _products = [];

  @override
  Future<List<Product>> getAllProducts() async => _products;

  @override
  Future<Product> getProductById(String id) async =>
      _products.firstWhere((p) => p.id == id);

  @override
  Future<void> createProduct(Product product) async => _products.add(product);

  @override
  Future<void> updateProduct(Product product) async {
    final index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) _products[index] = product;
  }

  @override
  Future<void> deleteProduct(String id) async =>
      _products.removeWhere((p) => p.id == id);
}

void main() {
  late ProductRepository repository;

  setUp(() {
    repository = FakeProductRepository();
  });

  test('should create and retrieve a product', () async {
    final product = Product(
      id: '1',
      name: 'Phone',
      description: 'Smartphone',
      price: 500.0,
      imageUrl: 'http://img.com/p1',
    );

    await repository.createProduct(product);
    final all = await repository.getAllProducts();

    expect(all, contains(product));
  });
}
