import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:contracts_of_data_sources1/features/products/domain/entities/product.dart';
import 'package:contracts_of_data_sources1/features/products/domain/repositories/product_repository.dart';
import 'package:contracts_of_data_sources1/core/error/failure.dart';

class FakeProductRepository implements ProductRepository {
  final List<Product> _products = [];

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    return Right(_products);
  }

  @override
  Future<Either<Failure, Product>> getProductById(String id) async {
    try {
      final product = _products.firstWhere((p) => p.id == id);
      return Right(product);
    } catch (_) {
      return Left(CacheFailure()); // Not found or empty cache
    }
  }

  @override
  Future<Either<Failure, void>> createProduct(Product product) async {
    _products.add(product);
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> updateProduct(Product product) async {
    final index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _products[index] = product;
      return const Right(null);
    } else {
      return Left(CacheFailure()); // Product not found
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(String id) async {
    final beforeCount = _products.length;
    _products.removeWhere((p) => p.id == id);
    final afterCount = _products.length;

    if (afterCount < beforeCount) {
      return const Right(null); // Successfully removed
    } else {
      return Left(CacheFailure()); // Product not found
    }
  }
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

    final createResult = await repository.createProduct(product);
    expect(createResult.isRight(), true);

    final allResult = await repository.getAllProducts();
    expect(allResult.isRight(), true);

    allResult.fold(
      (failure) => fail('Expected success but got failure'),
      (products) => expect(products, contains(product)),
    );
  });

  test('should fail to get a product by invalid id', () async {
    final result = await repository.getProductById('invalid-id');
    expect(result.isLeft(), true);
  });

  test('should delete a product', () async {
    final product = Product(
      id: '2',
      name: 'Laptop',
      description: 'Gaming laptop',
      price: 1500.0,
      imageUrl: 'http://img.com/p2',
    );

    await repository.createProduct(product);
    final deleteResult = await repository.deleteProduct('2');
    expect(deleteResult.isRight(), true);

    final getResult = await repository.getProductById('2');
    expect(getResult.isLeft(), true);
  });
}
