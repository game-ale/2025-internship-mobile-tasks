import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task9/domain/entities/product.dart';
import 'package:task9/domain/usecases/insert_product_usecase.dart';

import 'usecase_test_helper.mocks.dart';

void main() {
  late InsertProductUsecase usecase;
  late MockProductRepository mockRepository;

  setUp(() {
    mockRepository = MockProductRepository();
    usecase = InsertProductUsecase(mockRepository);
  });

  const newProduct = Product(
    id: '1',
    name: 'New Product',
    description: 'New product description',
    price: 15.99,
    imageUrl: 'http://example.com/new.png',
  );

  test('should insert a product using the repository', () async {
    // arrange
    when(mockRepository.insertProduct(newProduct))
        .thenAnswer((_) async => Future.value());

    // act
    await usecase(newProduct);

    // assert
    verify(mockRepository.insertProduct(newProduct)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
