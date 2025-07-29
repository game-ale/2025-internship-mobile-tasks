import 'package:flutter_test/flutter_test.dart';
import 'package:data_overview_layer/features/products/domain/entities/product.dart';
import 'package:data_overview_layer/features/products/domain/usecases/view_product.dart';
import 'package:mockito/mockito.dart';
import 'package:data_overview_layer/features/products/domain/repositories/product_repository.dart';


class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late ViewProduct usecase;
  late MockProductRepository mockRepo;

  setUp(() {
    mockRepo = MockProductRepository();
    usecase = ViewProduct(mockRepo);
  });

  const productId = '1';
  const product = Product(id: '1', name: 'P1', price: 20.0, description: '', imageUrl: 'https://example.com/image.jpg',);

  test('should return product by ID', () async {
    when(mockRepo.getProductById(productId))
        .thenAnswer((_) async => product);

    final result = await usecase(productId);

    expect(result, product);
    verify(mockRepo.getProductById(productId)).called(1);
  });
}
