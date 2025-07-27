import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task9/domain/entities/product.dart';
import 'package:task9/domain/usecases/update_product_usecase.dart';

import 'usecase_test_helper.mocks.dart';

void main() {
  late UpdateProductUsecase usecase;
  late MockProductRepository mockRepository;

  setUp(() {
    mockRepository = MockProductRepository();
    usecase = UpdateProductUsecase(mockRepository);
  });

  const updatedProduct = Product(
    id: '1',
    name: 'Updated Name',
    description: 'Updated Description',
    price: 12.99,
    imageUrl: 'http://example.com/new.png',
  );

  test('should update the product in the repository', () async {
    // arrange
    when(mockRepository.updateProduct(updatedProduct))
        .thenAnswer((_) async => Future.value());

    // act
    await usecase(updatedProduct);

    // assert
    verify(mockRepository.updateProduct(updatedProduct)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
