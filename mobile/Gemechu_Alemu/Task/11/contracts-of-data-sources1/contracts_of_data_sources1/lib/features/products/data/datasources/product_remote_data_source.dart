import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> fetchAllProducts();
  Future<ProductModel> fetchProductById(String id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  @override
  Future<List<ProductModel>> fetchAllProducts() async {
    // TODO: Implement API call
    throw UnimplementedError();
  }

  @override
  Future<ProductModel> fetchProductById(String id) async {
    // TODO: Implement API call
    throw UnimplementedError();
  }
}
