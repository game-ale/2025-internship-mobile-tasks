import 'package:flutter_test/flutter_test.dart';
import 'package:contracts_of_data_sources1/features/products/domain/entities/product.dart';

void main() {
  group('Product Entity', () {
    test('should create a valid Product instance', () {
      const product = Product(
        id: '1',
        name: 'Test Product',
        price: 100.0,
        description: 'This is a test product',
         imageUrl: 'https://example.com/image.jpg',
      );

      expect(product.id, '1');
      expect(product.name, 'Test Product');
      expect(product.price, 100.0);
      expect(product.description, 'This is a test product');
    });

    test('should support value comparison', () {
      const product1 = Product(
        id: '1',
        name: 'Test Product',
        price: 100.0,
        description: 'This is a test product',
         imageUrl: 'https://example.com/image.jpg',
      );

      const product2 = Product(
        id: '1',
        name: 'Test Product',
        price: 100.0,
        description: 'This is a test product',
         imageUrl: 'https://example.com/image.jpg',
      );

      expect(product1, equals(product2));
    });
  });
}