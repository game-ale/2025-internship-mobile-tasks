import 'package:flutter_test/flutter_test.dart';
import 'package:data_overview_layer/features/products/domain/entities/product.dart';
import 'package:data_overview_layer/features/products/domain/usecases/update_product.dart';
import 'package:mockito/mockito.dart';
import 'package:data_overview_layer/features/products/domain/repositories/product_repository.dart';


class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late UpdateProduct usecase;
  late MockProductRepository mockRepo;

  setUp(() {
    mockRepo = MockProductRepository();
    usecase = UpdateProduct(mockRepo);
  });

  const updatedProduct = Product(
    id: '1',
    name: 'Updated Product',
    price: 150.0,
    description: 'Updated',
    imageUrl: 'https://example.com/image.jpg',

  );

  test('should call ProductRepository.updateProduct', () async {
    when(mockRepo.updateProduct(updatedProduct))
        .thenAnswer((_) async => Future.value());

    await usecase(updatedProduct);

    verify(mockRepo.updateProduct(updatedProduct)).called(1);
  });
}
