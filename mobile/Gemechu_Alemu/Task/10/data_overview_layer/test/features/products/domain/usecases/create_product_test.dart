import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:data_overview_layer/features/products/domain/entities/product.dart';
import 'package:data_overview_layer/features/products/domain/repositories/product_repository.dart';
import 'package:data_overview_layer/features/products/domain/usecases/create_product.dart';


class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late CreateProduct usecase;
  late MockProductRepository mockRepo;

  setUp(() {
    mockRepo = MockProductRepository();
    usecase = CreateProduct(mockRepo);
  });

  const testProduct = Product(
    id: '1',
    name: 'New Product',
    price: 99.0,
    description: 'Test',
    imageUrl: 'https://example.com/image.jpg', 
  );

  test('should call ProductRepository.createProduct with the correct product', () async {
   
    when(mockRepo.createProduct(testProduct))
        .thenAnswer((_) async => Future.value());

    await usecase(testProduct);

  
    verify(mockRepo.createProduct(testProduct)).called(1);
    verifyNoMoreInteractions(mockRepo);
  });
}
