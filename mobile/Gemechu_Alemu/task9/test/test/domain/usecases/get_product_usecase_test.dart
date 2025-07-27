import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task9/domain/entities/product.dart';
import 'package:task9/domain/usecases/get_product_usecase.dart';

import 'usecase_test_helper.mocks.dart';

void main() {
  late GetProductUsecase usecase;
  late MockProductRepository mockRepository;

  setUp(() {
    mockRepository = MockProductRepository();
    usecase = GetProductUsecase(mockRepository);
  });

  const testProduct = Product(
    id: '1',
    name: 'Test Product',
    description: 'Test Desc',
    price: 9.99,
    imageUrl: 'http://example.com/img.png',
  );

  test('should get product from the repository by ID', () async {
    // arrange
    when(mockRepository.getProduct('1'))
        .thenAnswer((_) async => testProduct);

    // act
    final result = await usecase('1');

    // assert
    expect(result, testProduct);
    verify(mockRepository.getProduct('1')).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
