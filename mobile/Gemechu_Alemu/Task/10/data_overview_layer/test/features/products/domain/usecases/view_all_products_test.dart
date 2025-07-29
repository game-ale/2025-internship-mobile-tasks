import 'package:flutter_test/flutter_test.dart';
import 'package:data_overview_layer/features/products/domain/entities/product.dart';
import 'package:data_overview_layer/features/products/domain/usecases/view_all_products.dart';
import 'package:mockito/mockito.dart';
import 'package:data_overview_layer/features/products/domain/repositories/product_repository.dart';


class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late ViewAllProducts usecase;
  late MockProductRepository mockRepo;

  setUp(() {
    mockRepo = MockProductRepository();
    usecase = ViewAllProducts(mockRepo);
  });

  const products = [
    Product(id: '1', name: 'P1', price: 20.0, description: '', imageUrl: 'https://example.com/image.jpg',),
  ];

  test('should return list of products', () async {
    when(mockRepo.getAllProducts())
        .thenAnswer((_) async => products);

    final result = await usecase();

    expect(result, products);
    verify(mockRepo.getAllProducts()).called(1);
  });
}
