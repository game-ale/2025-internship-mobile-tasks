import 'package:flutter_test/flutter_test.dart';
import 'package:data_overview_layer/features/products/data/models/product_model.dart';

void main() {
  const productModel = ProductModel(
    id: '1',
    name: 'Laptop',
    description: 'A good laptop',
    price: 1200.0,
    imageUrl: 'http://image.url',
  );

  final productJson = {
    'id': '1',
    'name': 'Laptop',
    'description': 'A good laptop',
    'price': 1200.0,
    'imageUrl': 'http://image.url',
  };

  test('fromJson should return a valid model', () {
    final result = ProductModel.fromJson(productJson);
    expect(result, equals(productModel));
  });

  test('toJson should return a valid map', () {
    final result = productModel.toJson();
    expect(result, equals(productJson));
  });
}
