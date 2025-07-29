import 'package:flutter_test/flutter_test.dart';
import 'package:data_overview_layer/features/products/domain/usecases/delete_product.dart';
import 'package:mockito/mockito.dart';
import 'package:data_overview_layer/features/products/domain/repositories/product_repository.dart';


class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late DeleteProduct usecase;
  late MockProductRepository mockRepo;

  setUp(() {
    mockRepo = MockProductRepository();
    usecase = DeleteProduct(mockRepo);
  });

  const productId = '1';

  test('should call ProductRepository.deleteProduct', () async {
    when(mockRepo.deleteProduct(productId))
        .thenAnswer((_) async => Future.value());

    await usecase(productId);

    verify(mockRepo.deleteProduct(productId)).called(1);
  });
}
