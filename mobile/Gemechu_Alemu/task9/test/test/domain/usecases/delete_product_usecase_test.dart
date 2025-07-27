import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task9/domain/usecases/delete_product_usecase.dart';

import 'usecase_test_helper.mocks.dart';

void main() {
  late DeleteProductUsecase usecase;
  late MockProductRepository mockRepository;

  setUp(() {
    mockRepository = MockProductRepository();
    usecase = DeleteProductUsecase(mockRepository);
  });

  const productId = '1';

  test('should delete product from repository by ID', () async {
    // arrange
    when(mockRepository.deleteProduct(productId))
        .thenAnswer((_) async => Future.value());

    // act
    await usecase(productId);

    // assert
    verify(mockRepository.deleteProduct(productId)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
